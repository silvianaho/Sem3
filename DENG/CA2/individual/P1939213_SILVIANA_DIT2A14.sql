-- Databricks notebook source
-- MAGIC %python
-- MAGIC # dbutils.fs.mkdirs("dbfs:/FileStore/tables/carSalesCA2")
-- MAGIC # dbutils.fs.rm("/FileStore/tables/carSalesCA2", True)
-- MAGIC dbutils.fs.ls("/FileStore/tables/carSalesCA2")

-- COMMAND ----------

-- DROP TABLE IF EXISTS CarSalesDW_B.SalesFact;
-- DROP TABLE IF EXISTS CarSalesDW_B.orderDIM;
-- DROP TABLE IF EXISTS CarSalesDW_B.productDIM;
-- DROP TABLE IF EXISTS CarSalesDW_B.paymentDIM;
-- DROP TABLE IF EXISTS CarSalesDW_B.customerDIM;
-- DROP TABLE IF EXISTS CarSalesDW_B.employeesDIM;
-- DROP TABLE IF EXISTS CarSalesDW_B.officeDIM;
-- DROP DATABASE IF EXISTS CarSalesDW_B;
CREATE DATABASE CarSalesDW_B;

-- COMMAND ----------

USE CarSalesDW_B;
CREATE TABLE IF NOT EXISTS
  officeDIM(
    officeId INT, 
    officeCode STRING, 
    city STRING, 
    phone STRING, 
    addressLine1 STRING, 
    addressLine2 STRING, 
    state STRING, 
    country STRING, 
    postalCode STRING, 
    territory STRING
    )
USING CSV
OPTIONS(path "/FileStore/tables/carSalesCA2/officeDIM.csv", inferSchema "true");

-- COMMAND ----------

SELECT * FROM officeDIM LIMIT 10;

-- COMMAND ----------

USE CarSalesDW_B;
CREATE TABLE IF NOT EXISTS
  employeesDIM (
	employeeId INT, 
	employeeNumber INT,
	lastName STRING,
	firstName STRING,
	extension STRING,
	email STRING,
	reportsTo INT,
	jobTitle STRING
    )
USING CSV
OPTIONS(path "/FileStore/tables/carSalesCA2/employeesDIM.csv", inferSchema "true");

-- COMMAND ----------

SELECT * FROM employeesDIM;

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS customerDIM
USING CSV
OPTIONS(path "/FileStore/tables/carSalesCA2/customer.csv", header "true", inferSchema "true");

-- COMMAND ----------

SELECT * FROM customerDIM;

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS paymentDIM
USING CSV
OPTIONS(path "/FileStore/tables/carSalesCA2/payment.csv", header "true", inferSchema "true");

-- COMMAND ----------

SELECT * FROM paymentDIM LIMIT 10;
-- DESCRIBE TABLE paymentDIM; 

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS productDIM
USING CSV
OPTIONS(path "/FileStore/tables/carSalesCA2/productDIM.csv", header "true", inferSchema "true");

-- COMMAND ----------

SELECT * FROM productDIM;

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS orderDIM
USING CSV
OPTIONS(path "/FileStore/tables/carSalesCA2/order.csv", header "true", inferSchema "true");

-- COMMAND ----------

SELECT * FROM orderDIM;

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS salesFact
USING CSV
OPTIONS(path "/FileStore/tables/carSalesCA2/salesFact.csv", header "true", inferSchema "true");

-- COMMAND ----------

SELECT * FROM salesFact LIMIT 10;

-- COMMAND ----------

SELECT
	customerDIM.customerName, 
	(SELECT COUNT(DISTINCT orderNumber) 
     FROM salesFact 
     WHERE salesFact.customerNumber = customerDIM.customerNumber) orderCount 
FROM customerDIM
ORDER BY orderCount DESC

-- COMMAND ----------

SELECT 
	offices.*,
	CAST(ROUND(AVG(offices.TotalSales) OVER (), 2) AS DOUBLE) OfficesAverageSales,
	ROUND(offices.TotalSales - CAST(ROUND(AVG(offices.TotalSales) OVER (), 2) AS DOUBLE), 2) SalesDiff
FROM
	(SELECT 
		sf.officeCode,
		CAST(ROUND(SUM(sf.unitPrice * sf.quantity), 2) AS DOUBLE) AS TotalSales
	FROM 
		SalesFact AS sf
	WHERE 
		SUBSTRING(sf.TimeKey, 1, 4) = '2004'
	GROUP BY officeCode) AS offices
ORDER BY offices.TotalSales DESC;

-- COMMAND ----------

USE CarSalesDW_B;
SELECT 
	offices.*,
	CAST(ROUND(AVG(offices.TotalSales) OVER (), 2) AS DOUBLE) OfficesAverageSales,
    ROUND((offices.TotalSales - AVG(offices.TotalSales) OVER ()), 2) SalesDiff
FROM
	(SELECT 
        sf.officeCode OfficeCode,
        ofc.country Country,
        ec.EmployeeCount,
        mo.Month HighestSellingMonth,
        mo.TotalMonthlySales,
        prod.productCode ProductCode,
        prod.TotalProductSold,
        pl.productLine ProductLine,
        pl.ProductLineSold,
        ROUND(SUM(sf.quantity * (sf.unitPrice - sf.buyPrice)), 2) TotalProfit,
        CAST(ROUND(SUM(sf.unitPrice * sf.quantity), 2) AS DOUBLE) AS TotalSales
     FROM 
        salesFact AS sf
        INNER JOIN officeDIM ofc ON ofc.officeCode = sf.officeCode
        INNER JOIN 
          (SELECT 
             COUNT(DISTINCT employeeNumber) EmployeeCount, 
             officeCode 
           FROM salesFact sf1
           WHERE SUBSTRING(sf1.timeKey, 1, 4) = '2004'
           GROUP BY officeCode) ec ON ec.officeCode = sf.officeCode
        INNER JOIN 
          (SELECT * FROM (SELECT 
            officeCode,
            SUBSTRING(timeKey, 5, 2) Month,
            ROUND(SUM(sf2.unitPrice * sf2.quantity), 2) TotalMonthlySales,
            row_number() over (partition by officeCode order by SUM(sf2.unitPrice * sf2.quantity) desc) OfficeRank 
           FROM 
            salesFact sf2
           WHERE SUBSTRING(sf2.timeKey, 1, 4) = '2004'
           GROUP BY officeCode, SUBSTRING(timeKey, 5, 2))
           WHERE OfficeRank = 1) mo ON mo.officeCode = sf.officeCode
       INNER JOIN
         (SELECT * FROM (SELECT 
            officeCode,
            productCode,
            SUM(sf3.quantity) TotalProductSold,
            row_number() OVER (PARTITION BY officeCode ORDER BY SUM(sf3.quantity) DESC) product_rank 
          FROM
            salesFact sf3
          WHERE SUBSTRING(sf3.timeKey, 1, 4) = '2004'
          GROUP BY officeCode, productCode)
          WHERE product_rank = 1
          ORDER BY TotalProductSold DESC) prod ON prod.officeCode = sf.officeCode
       INNER JOIN
         (SELECT * FROM (SELECT 
            sf4.officeCode,
            p.productLine,
            SUM(sf4.quantity) ProductLineSold,
            row_number() OVER (PARTITION BY sf4.officeCode ORDER BY SUM(sf4.quantity) DESC) product_line_rank 
          FROM 
            salesFact sf4
            INNER JOIN productDIM p ON p.productCode = sf4.productCode 
          GROUP BY sf4.officeCode, p.productLine)
          WHERE product_line_rank = 1
          ORDER BY ProductLineSold DESC) pl ON pl.officeCode = sf.officeCode
    GROUP BY sf.officeCode, 
              ec.EmployeeCount, 
              mo.Month, 
              mo.TotalMonthlySales, 
              prod.productCode, 
              prod.TotalProductSold, 
              pl.productLine, 
              pl.ProductLineSold, 
              ofc.country) AS offices
ORDER BY offices.TotalSales DESC;

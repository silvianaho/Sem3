
/* Query.sql*/

USE CarSalesDW_B;

-- Query 1: What are the top(5) product lines that have the highest profit? (row wise function[sales])
SELECT TOP(5) 
	productline, 
	SUM(quantity * (unitPrice - buyPrice)) 'Profit' 
FROM 
	SalesFact AS sf
	INNER JOIN productDIM AS p ON p.productCode = sf.productCode 
GROUP BY p.productLine 
ORDER BY Profit DESC


-- Query 2: Which customer has the most number of orders? (sub-query[orders/customers])
SELECT 
	cd.customerName, 
	orderCount = (SELECT COUNT(DISTINCT sf.orderNumber) 
				  FROM SalesFact AS sf
                  WHERE sf.customerNumber = cd.customerNumber)
FROM customerDIM as cd
GROUP BY cd.customerName, cd.customerNumber
ORDER BY orderCount DESC

-- Query 3: Which month has the least sales in different countries? (groupby [country][season of sales])
SELECT 
	td.MonthName, 
	ofc.country, 
	SUM(unitPrice * quantity ) TotalSales
FROM 
	salesFact AS sf 
	INNER JOIN timeDIM AS td ON td.timeKey = sf.timeKey
	INNER JOIN officeDIM AS ofc ON ofc.officeCode = sf.officeCode
GROUP BY td.MonthName, ofc.country 
ORDER BY TotalSales ASC


-- Query 4: Which office has below average sales in 2004? (aggregate function[standard deviation][office])
SELECT 
	offices.*,
	CAST(ROUND(AVG(offices.TotalSales) OVER (), 2) AS NUMERIC(10,2)) OfficesAverageSales,
	offices.TotalSales - CAST(ROUND(AVG(offices.TotalSales) OVER (), 2) AS NUMERIC(10,2)) SalesDiff
FROM
	(SELECT 
		sf.officeCode,
		CAST(ROUND(SUM(sf.unitPrice * sf.quantity), 2) AS NUMERIC(10,2)) AS TotalSales
	FROM 
		SalesFact AS sf
		INNER JOIN timeDIM AS t ON t.timeKey = sf.timeKey	
	WHERE 
		t.Year = '2004'
	GROUP BY officeCode) AS offices
ORDER BY offices.TotalSales DESC;

USE CarSalesDW_B

--------------officeDIM------
DELETE FROM officeDIM
INSERT INTO 
	CarSalesDW_B..officeDIM 
SELECT 
	* 
FROM 
	CarSalesB..Offices


------------employeesDIM----------------
DELETE FROM employeesDIM
INSERT INTO 
	CarSalesDW_B..employeesDIM
SELECT 
	e.employeeNumber, 
	e.lastName, 
	e.firstName, 
	e.extension, 
	e.email, 
	e.reportsTo, 
	e.jobTitle
FROM 
	CarSalesB..Employees e


--------------CustomerDIM------------
DELETE FROM CustomerDIM

INSERT INTO 
	CarSalesDW_B..customerDIM
SELECT 
	c.customerNumber, 
	c.customerName, 
	c.contactLastName, 
	c.contactFirstName, 
	c.phone, 
	c.addressLine1, 
	c.city, 
	c.postalCode,
	c.country,
	c.creditLimit
FROM 
	CarSalesB..Customers c


------productDIM------------
DELETE FROM productDIM
INSERT INTO 
	CarSalesDW_B..productDIM  
SELECT
	p.productCode, 
	p.productName, 
	p.productLine, 
	p.productScale, 
	p.productVendor, 
	p.productDescription, 
	p.MSRP
FROM 
	CarSalesB..Products p


-------orderDIM-------------------
DELETE FROM orderDIM
INSERT INTO 
	CarSalesDW_B..orderDIM
SELECT
	o.orderNumber,
	o.orderDate,
	o.requiredDate,
	o.shippedDate,
	o.status,
	o.comments
FROM 
	CarSalesB..Orders o
 

 ------paymentDIM-----------
DELETE FROM paymentDIM
INSERT INTO
	CarSalesDW_B..paymentDIM
SELECT 
	*
FROM 
	CarSalesB..Payments
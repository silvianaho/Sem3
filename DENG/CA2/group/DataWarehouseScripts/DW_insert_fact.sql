USE CarSalesDW_B;

DELETE FROM SalesFact
INSERT INTO 
	CarSalesDW_B..SalesFact
SELECT
	od.quantityOrdered,
	od.priceEach unitPrice,
	p.buyPrice,
	ofc.officeCode,
	e.employeeNumber,
	c.customerNumber,
	o.orderNumber,
	p.productCode,
	REPLACE(CONVERT(DATE,o.OrderDate, 112),'-','') timeKey
FROM 
	CarSalesB..[OrderDetails] od 
	INNER JOIN CarSalesB..[Orders] o ON od.orderNumber = o.orderNumber
	INNER JOIN CarSalesB..[Products] p ON od.productCode = p.productCode
	INNER JOIN CarSalesB..[Customers] c ON o.customerNumber = c.customerNumber
	INNER JOIN CarSalesB..[Employees] e ON c.salesRepEmployeeNumber = e.employeeNumber
	INNER JOIN CarSalesB..[Offices] ofc ON e.officeCode = ofc.officeCode;
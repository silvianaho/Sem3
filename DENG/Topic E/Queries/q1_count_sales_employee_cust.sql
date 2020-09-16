/*
SELECT COUNT(*) 'No of Sales Record'
FROM SalesFacts AS s;

SELECT COUNT(*) 'No of Employees Record'
FROM EmployeeDIM AS e;

SELECT COUNT(*) 'No of Customer Record'
FROM CustomerDIM AS c;
*/

SELECT 
	* 
FROM (
	SELECT COUNT(*) AS SalesRows
	FROM SalesFacts
	) AS sales
CROSS JOIN (
	SELECT COUNT(*) AS EmployeeRows
	FROM EmployeeDIM
	) AS employees
CROSS JOIN (
	SELECT COUNT(*) AS CustomerRows
	FROM CustomerDIM
	) AS customers;
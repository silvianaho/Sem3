SELECT
	TOP (1)
	CONCAT(e.FirstName, ' ', e.LastName) 'EmployeeName',
	ROUND(SUM((s.Quantity * s.UnitPrice) * (1 - s.Discount)), 2) 'quantity'
FROM
	SalesFacts AS s
	INNER JOIN EmployeeDIM AS e ON e.EmployeeKey = s.EmployeeKey
	INNER JOIN TimeDim AS t ON t.TimeKey = s.TimeKey
WHERE t.Year = 1996
GROUP BY CONCAT(e.FirstName, ' ', e.LastName)
ORDER BY quantity DESC
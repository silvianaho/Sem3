SELECT 
	TOP (1) 
	p.ProductName,
	SUM(s.Quantity) 'quantity',
	t.DayName 
FROM 
	SalesFacts AS s
	INNER JOIN TimeDim AS t ON t.TimeKey = s.TimeKey
	INNER JOIN ProductDIM AS p ON p.ProductKey = s.ProductKey
WHERE t.DayName = 'Tuesday'
GROUP BY p.ProductName, t.DayName
ORDER BY quantity DESC
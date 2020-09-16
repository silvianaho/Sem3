SELECT
	TOP (1)
	c.ContactName,
	ROUND(SUM((s.Quantity * s.UnitPrice) * (1 - s.Discount)), 2) 'quantity'
FROM
	SalesFacts AS s
	INNER JOIN CustomerDIM AS c ON c.CustomerKey = s.CustomerKey
	INNER JOIN TimeDim AS t ON t.TimeKey = s.TimeKey
WHERE t.Year = 1998 AND t.Quarter = '1'
GROUP BY c.ContactName
ORDER BY quantity DESC
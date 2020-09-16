SELECT
	TOP (1)
	r.RegionDesc,
	ROUND(SUM((s.Quantity * s.UnitPrice) * (1 - s.Discount)), 2) 'quantity'
FROM
	SalesFacts AS s
	INNER JOIN RegionDIM AS r ON r.RegionKey = s.RegionKey
	INNER JOIN TimeDim AS t ON t.TimeKey = s.TimeKey
WHERE t.Year = 1997 AND t.Month = 12
GROUP BY r.RegionDesc
ORDER BY quantity ASC
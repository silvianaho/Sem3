SELECT 
	r.Description 'Region',
	SUM(s.Quantity * s.Price) AS 'Total Revenue'
FROM
	SalesFacts AS s
LEFT JOIN Region AS r ON r.Region_Key = s.Region_Key
GROUP BY r.Description;
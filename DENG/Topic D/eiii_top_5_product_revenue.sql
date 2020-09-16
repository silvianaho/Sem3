SELECT 
	TOP(5) p.Description 'Product',
	SUM(s.Quantity * s.Price) AS 'Total Revenue'
FROM 
	SalesFacts AS s
LEFT JOIN Product AS p ON p.Product_Key = s.Product_Key
GROUP BY p.Description
ORDER BY 'Total Revenue' DESC;
SELECT 
	TOP(1) p.Brand 'Brand',
	SUM(s.Quantity) 'Quantity'
FROM 
	SalesFacts AS s
LEFT JOIN Product AS p ON p.Product_Key = s.Product_Key
GROUP BY p.Brand, s.Quantity
ORDER BY s.Quantity DESC;
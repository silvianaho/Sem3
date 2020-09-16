SELECT 
	TOP (1) p.Description AS 'Product_Name',
	v.Vendor_Name,
	SUM(s.Quantity * s.Price) AS 'Revenue'
FROM 
	SalesFacts AS s
LEFT JOIN Product AS p ON p.Product_Key = s.Product_Key
LEFT JOIN Vendor AS v ON v.Vendor_Key = s.Vendor_Key
GROUP BY p.Description, v.Vendor_Name
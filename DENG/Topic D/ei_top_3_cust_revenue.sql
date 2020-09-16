SELECT 
	TOP(3) c.Customer_Name, 
	SUM(s.Quantity * s.Price) AS Sales_Revenues
FROM Customer as c, SalesFacts as s
WHERE c.Customer_Key = s.Customer_Key
GROUP BY c.Customer_Name
ORDER BY Sales_Revenues DESC;
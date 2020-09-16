SELECT 
	Staff_Name,
	YEAR(GETDATE())-Join_Yr 'Years in Service'
FROM 
	Staff_Relation
ORDER BY
	[Years in Service] DESC;
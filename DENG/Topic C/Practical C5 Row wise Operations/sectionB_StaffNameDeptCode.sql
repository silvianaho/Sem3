SELECT
	Staff_No,
	Staff_Name + ' (' + Dept_Cd + ')' Academic_Staff
FROM
	Staff_Relation
WHERE
	SUBSTRING(Staff_No, 1,1) = 'S'
ORDER BY 
	Academic_Staff ASC
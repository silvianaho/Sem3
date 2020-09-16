SELECT
	Staff_Name,
	ISNULL(Pay, 0) + ISNULL(Allowance,0) Salary,
	2.25*(ISNULL(Pay, 0) + ISNULL(Allowance,0)) Bonus
FROM
	Staff_Relation
WHERE
	Pay IS NOT NULL
ORDER BY 
	2.25*(ISNULL(Pay, 0) + ISNULL(Allowance,0));
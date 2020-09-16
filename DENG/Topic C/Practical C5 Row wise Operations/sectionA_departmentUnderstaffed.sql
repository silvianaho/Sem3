SELECT
	Dept_Name,
	Max_Staff_Strength,
	No_Of_Staff,
	Max_Staff_Strength-No_Of_Staff 'number understaffed'
FROM
	Department_Relation
ORDER BY
	[number understaffed] DESC
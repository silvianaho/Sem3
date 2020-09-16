SELECT
	Crse_Cd,
	Crse_Name,
	LEN(Crse_Name) 'Length of Diploma Name'
FROM
	Course_Relation
WHERE
	LEN(Crse_Name) > 31
ORDER BY
	[Length of Diploma Name] ASC
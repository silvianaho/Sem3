SELECT
	UPPER(Crse_Cd) 'COURSE CODE',
	UPPER(Crse_Name) 'COURSE NAME',
	LOWER(Crse_Cd) 'course code',
	LOWER(Crse_Name) 'course name'
FROM
	Course_Relation;
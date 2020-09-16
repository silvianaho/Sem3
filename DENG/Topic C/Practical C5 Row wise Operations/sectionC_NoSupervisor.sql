SELECT 
	Staff_No,
	Staff_Name,
	ISNULL(CAST(Supervisor AS varchar(13)), 'No Supervisor') Supervisor
FROM 
	Staff_Relation
WHERE
	Supervisor IS NULL
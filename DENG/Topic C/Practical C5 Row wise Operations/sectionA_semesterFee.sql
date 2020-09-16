SELECT 
	Crse_Cd,
	Crse_Name,
	Crse_Fee,
	Lab_Fee,
	ISNULL(Lab_Fee, 0) LabFee,
	Crse_Fee + ISNULL(Lab_Fee, 0) Semester_Fee
FROM 
	Course_Relation
ORDER BY Semester_Fee ASC;
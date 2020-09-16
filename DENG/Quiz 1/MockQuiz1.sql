/*
Name: SILVIANA
Student ID: 1939213
Class: DIT/FT/2A/14
*/

/* Enter your answer in order of the Class Test Questions */
use Royal_Poly_DB;

-- Q1
SELECT 
	Staff_Name, Marital_Status 
FROM 
	Staff_Relation
WHERE 
	Marital_Status = 'D' OR 
	Marital_Status = 'S';

-- Q2
SELECT 
	Staff_Name, 
	ISNULL(Supervisor, 'No Supervisor') 'Supervisor ID'
FROM 
	Staff_Relation
WHERE 
	Pay > 5000;

-- Q3
SELECT
	Dept_Cd,
	MAX(Pay) 'Highest Pay',
	MIN(Pay) 'Lowest Pay',
	MIN(Allowance) 'Lowest Allowance'
FROM
	Staff_Relation
GROUP BY
	Dept_Cd;
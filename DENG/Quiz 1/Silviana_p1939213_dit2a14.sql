/*
Name: SILVIANA
Student ID: 1939213
Class: DIT/FT/2A/14
*/

/* Enter your answer in order of the Class Test Questions */
use Royal_Poly_DB;

-- Q1
SELECT 
	Crse_Name,
	Crse_Fee,
	(ISNULL(CAST(Lab_Fee as varchar(10)),'na')) AS Lab_Fee
FROM
	Course_Relation
ORDER BY
	Offered_By, Crse_Name ASC;

-- Q2
SELECT
	*,
	ISNULL(Pay, 0)*1.03 'New Pay',
	ISNULL(Pay, 0)*1.02 'New Allowance'
FROM
	Staff_Relation
WHERE
	Grade = 'L5';

-- Q3
SELECT 
	Dept_Cd, 
	COUNT(CASE WHEN gender='F' THEN 1 END) Female, 
	COUNT(CASE WHEN gender='M' THEN 1 END) Male 
FROM 
	Staff_Relation 
GROUP BY 
	Dept_Cd;

-- Q4
SELECT 
	* 
FROM 
	Staff_Relation 
WHERE 
	Staff_Name LIKE '%' + 'on' OR 
	Staff_Name LIKE '%it%';

-- Q5
SELECT 
	Dept_Cd, 
	AVG(YEAR(GETDATE()) - YEAR(DOB)) 'Average Age' 
FROM 
	Staff_Relation 
WHERE 
	Type_of_Employment = 'FT' 
GROUP BY 
	Dept_Cd;
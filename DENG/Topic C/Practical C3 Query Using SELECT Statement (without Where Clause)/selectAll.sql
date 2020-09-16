/* Write two different SQL statements to display all columns and all rows of the Staff relation. */

/* Using star */
SELECT * FROM Staff_Relation;

/* Specify the column names */
SELECT 
	[Staff_No],
	[Staff_Name],
	[Supervisor],
	[DOB],
	[Grade],
	[Marital_Status],
	[Pay],
	[Allowance],
	[Hourly_Rate],
	[Gender],
	[Citizenship],
	[Join_Yr],
	[Dept_Cd],
	[Type_of_Employment],
	[Highest_Qln],
	[Designation]
FROM 
	Staff_Relation;
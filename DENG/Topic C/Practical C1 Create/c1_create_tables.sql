Create table Staff_Relation(
	Staff_No Char(4) Not Null,
	Staff_Name Varchar(100) Not Null,
	Supervisor Char(4),
	DOB Date NOT NULL,
	Grade Varchar(5) NOT NULL,
	Marital_Status Char(1) NOT NULL,
	Pay Decimal(7,2),
	Allowance Decimal(7,2),
	Hourly_Rate Decimal(7,2),
	Gender char(1) not null,
	Citizenship varchar(10) not null,
	Join_Yr int not null,
	Dept_Cd varchar(5) not null,
	Type_of_Employment char(2) not null,
	Highest_Qln varchar(10) not null,
	Designation varchar(20) not null,
	Primary key (Staff_No)
)

CREATE TABLE Course_Relation(
	Crse_Cd varchar(5) not null,
	Crse_Name varchar(100) not null,
	Offered_By varchar(5) not null,
	Crse_Fee decimal(7,2) not null,
	Lab_Fee decimal(7,2),
	Primary key(Crse_cd)
)

CREATE TABLE Department_Relation(
	Dept_Cd varchar(5) not null,
	Dept_Name varchar(100) not null,
	HOD char(4),
	No_Of_Staff int,
	Max_Staff_Strength int,
	Budget decimal(9,2),
	Expenditure decimal(9,2),
	HOD_Start_Date date,
	PRIMARY KEY(Dept_Cd)
)
/*a. Create the table staff_relation_backup*/
CREATE TABLE Staff_Relation_Backup(
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
);

/*b. Insert records into the staff_relation_backup (use INSERT INTO FROM SQL)*/

INSERT INTO 
	Staff_Relation_Backup
SELECT
	*
FROM
	Staff_Relation;

/* SELECT all to check the records */
SELECT * FROM Staff_Relation_Backup;
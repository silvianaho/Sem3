/* 1. Insert into the Course_Relation those diploma courses without lab_fee. Do not specify NULL in
the column value list. */
INSERT INTO 
	Course_Relation (Crse_Cd, Crse_Name, Offered_By,Crse_Fee)
VALUES
	('DBA','Diploma in Business Administration','SB',500.00),
	('DFI','Diploma in Financial Informatics','SB',800.00);

/* 2. Insert into the Course_Relation those diploma courses with lab_fee. Do not specify the column
list.*/
INSERT INTO 
	Course_Relation
VALUES
	('DBIT','Diploma in Business and Information Technology','DMIT',700.00, 100.00),
	('DDM','Diploma in Digital Media','DMIT',1000.00, 900.00),
	('DISM','Diploma in Infocomm Security Management','DMIT',900.00, 300.00),
	('DIT','Diploma in Information Technology','DMIT',650.00, 450.00);

/*3. Use the SELECT statement to list all the rows in the table (with all the attributes/columns).*/
SELECT * FROM Course_Relation;
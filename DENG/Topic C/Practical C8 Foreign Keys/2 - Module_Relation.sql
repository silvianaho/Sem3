--DBMS SQL Practical 8 Module_Relation
-- Explain the errors you may encounter in populating the table.
-- Number of rows in table = 13

Create Table Module_Relation
( Mod_Cd varchar(10) primary key,
  Mod_Name varchar(100) not null,
  Credit_Unit integer not null,
  Mod_Coord  char(4) null,
  foreign key ( Mod_Coord ) References Staff_Relation ( Staff_No ) )
    
Insert Into Module_Relation
Values
('AIP','Accounting Informatics Project',4,'S018')

Insert Into Module_Relation
Values
('AIS','Accounting Information System',4,'S019')

Insert Into Module_Relation
Values
('BUAE','Business Analysis Using Excel',3,'S019')

Insert Into Module_Relation
Values
('CRM','Customer Relationship Management',3,'S019')

Insert Into Module_Relation
Values
('DBMS','Database Management System',5,'S020')

Insert Into Module_Relation
Values
('DM','Data Mining',4,'S018')

Insert Into Module_Relation
Values
('ITOS','IT and Office Software',4,'S018')

Insert Into Module_Relation
Values
('JPRG','Java Programming',8,'S017')

Insert Into Module_Relation
Values
('NETF','Network Fundamentals',3,'S017')

Insert Into Module_Relation
Values
('PM','Project Management',3,'S018')

Insert Into Module_Relation
Values
('SAD','Software Application Development',8,'S020')

Insert Into Module_Relation
Values
('SDT','Software Development Technique',5,'S019')

Insert Into Module_Relation
Values
('WCD','Web Client Development',4,'S018')

Insert Into Module_Relation
Values
('COS','Computer Operating Systems',5,'S016')

Insert Into Module_Relation
Values
('PM','Project Management',3,'S016')

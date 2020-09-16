-- DBMS SQL Practical 8 Staff_Dependent_relation
-- Number of rows in table = 19

Create Table Staff_Dependent_Relation
( Staff_No Char(4) ,
  Dependent_Name Varchar(30),
  Relationship Varchar(20) not null,
  primary key ( Staff_No, Dependent_Name),
  foreign Key ( Staff_No) References Staff_Relation (Staff_No) )

Insert Into Staff_Dependent_Relation
values
('S003','Chin Chin','Daughter')

Insert Into Staff_Dependent_Relation
values
('S003','Mei Mei','Wife')

Insert Into Staff_Dependent_Relation
values
('S003','Yang Yang','Son')

Insert Into Staff_Dependent_Relation
values
('S004','Chin chin','Wife')

Insert Into Staff_Dependent_Relation
values
('S005','Candice','Wife')

Insert Into Staff_Dependent_Relation
values
('S005','Mei Mei','Daughter')

Insert Into Staff_Dependent_Relation
values
('S005','Pamela','Daughter')

Insert Into Staff_Dependent_Relation
values
('S007','Judith','Wife')

Insert Into Staff_Dependent_Relation
values
('S008','Nelson','Son')

Insert Into Staff_Dependent_Relation
values
('S010','Felicia','Wife')

Insert Into Staff_Dependent_Relation
values
('S010','Jamie','Daughter')

Insert Into Staff_Dependent_Relation
values
('S010','Janet','Daughter')

Insert Into Staff_Dependent_Relation
values
('S010','Janny','Daughter')

Insert Into Staff_Dependent_Relation
values
('S010','Jerome','Son')

Insert Into Staff_Dependent_Relation
values
('S010','Judith','Daughter')

Insert Into Staff_Dependent_Relation
values
('S011','Jamie','Wife')

Insert Into Staff_Dependent_Relation
values
('S012','Mark','Son')

Insert Into Staff_Dependent_Relation
values
('S012','Shyna','Wife')


Insert Into Staff_Dependent_Relation
values
('T002','Mike','Husband')




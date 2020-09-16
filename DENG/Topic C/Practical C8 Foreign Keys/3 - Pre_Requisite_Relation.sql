--DBMS SQL Practical 8 Pre_requisite_relation

-- Explain the errors, if any.
-- Total number of rows = 11 

Create Table Pre_Requisite_Relation
( Mod_Cd varchar(10) ,
  Pre_Requisite varchar(10) ,
  primary key ( Mod_Cd, Pre_Requisite ) ,
  foreign key ( Mod_Cd ) References Module_Relation ( Mod_Cd  ),
  foreign key ( Pre_Requisite ) References Module_Relation ( Mod_Cd ))

Insert into Pre_Requisite_Relation
values 
('AIP','AIS')


Insert into Pre_Requisite_Relation
values 
('AIS','DBMS')

Insert into Pre_Requisite_Relation
values 
('AIS','JPRG')

Insert into Pre_Requisite_Relation
values 
('AIS','SDT')


Insert into Pre_Requisite_Relation
values 
('CRM','DBMS')

Insert into Pre_Requisite_Relation
values 
('DM','DBMS')

Insert into Pre_Requisite_Relation
values 
('SAD','JPRG')

Insert into Pre_Requisite_Relation
values 
('SAD','NETF')

Insert into Pre_Requisite_Relation
values 
('SAD','SDT')

Insert into Pre_Requisite_Relation
values 
('SAD','WCD')

Insert into Pre_Requisite_Relation
values 
('SDT','DBMS')
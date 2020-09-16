-- DBMS SQL Practical 8 Stud_Mod_Performance_Relation
-- Number of rows in table = 41

Create table stud_mod_performance_relation
( adm_no				char(4),
  mod_registered	varchar(10) ,
  mark					integer null,
  grade					char(2) null,
  primary key ( adm_no, mod_registered) ,
  foreign key ( adm_no ) references student_relation ( adm_no ), 
  foreign key ( mod_registered )  references module_relation ( mod_cd) ) 

--dfi
insert into stud_mod_performance_relation values
('A012','AIP',70,'B-')

insert into stud_mod_performance_relation values
('A012','AIS',81,'A')

insert into stud_mod_performance_relation values
('A012','BUAE',66,'C+')

--
insert into stud_mod_performance_relation values
('A011','AIP',60,'C-')

insert into stud_mod_performance_relation values
('A011','AIS',41,'F')

insert into stud_mod_performance_relation values
('A011','BUAE',36,'F')

--
insert into stud_mod_performance_relation values
('A010','AIP',86,'A')

insert into stud_mod_performance_relation values
('A010','AIS',81,'A')

insert into stud_mod_performance_relation values
('A010','BUAE',96,'AD')

insert into stud_mod_performance_relation values
('A010','AIP',86,'A')

insert into stud_mod_performance_relation values
('A010','AIS',81,'A')

-- DISM
insert into stud_mod_performance_relation values
('A009','SDT',81,'A')

insert into stud_mod_performance_relation values
('A009','NETF',68,'C+')

insert into stud_mod_performance_relation values
('A009','SAD',74,'B-')

--
insert into stud_mod_performance_relation values
('A008','SDT',11,'F')

insert into stud_mod_performance_relation values
('A008','NETF',58,'D+')

insert into stud_mod_performance_relation values
('A008','SAD',64,'C-')

-- DDM
insert into stud_mod_performance_relation values
('A007','PM',77,'B+')

insert into stud_mod_performance_relation values
('A007','WCD',78,'F+')

insert into stud_mod_performance_relation values
('A007','DBMS',88,'A')

insert into stud_mod_performance_relation values
('A007','JPRG',84,'A')


insert into stud_mod_performance_relation values
('A006','PM',57,'D+')

insert into stud_mod_performance_relation values
('A006','WCD',61,'C-')

insert into stud_mod_performance_relation values
('A006','DBMS',60,'C-')

insert into stud_mod_performance_relation values
('A006','JPRG',70,'B-')


insert into stud_mod_performance_relation values
('A005','PM',58,'D+')

insert into stud_mod_performance_relation values
('A005','WCD',64,'C-')

insert into stud_mod_performance_relation values
('A005','DBMS',64,'C-')

insert into stud_mod_performance_relation values
('A005','JPRG',73,'B-')


insert into stud_mod_performance_relation values
('A004','DBMS',80,'A')

insert into stud_mod_performance_relation values
('A004','JPRG',88,'A')

insert into stud_mod_performance_relation values
('A004','NETF',73,'B-')

insert into stud_mod_performance_relation values
('A001','DBMS',72,'B-')

insert into stud_mod_performance_relation values
('A001','JPRG',78,'B+')

insert into stud_mod_performance_relation values
('A001','NETF',87,'A')

-- DBIT

insert into stud_mod_performance_relation values
('A002','DBMS',72,'B-')

insert into stud_mod_performance_relation values
('A002','JPRG',78,'B+')

insert into stud_mod_performance_relation values
('A002','WCD',83,'A')

insert into stud_mod_performance_relation values
('A002','SAD',87,'A')

--
select * from stud_mod_performance_relation
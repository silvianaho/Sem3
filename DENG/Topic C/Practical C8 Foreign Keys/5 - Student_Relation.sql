--DBMS SQL Practical 8 Student_Relation
-- There is an error in the Create Table statement
-- Rectify the error before populating the table

-- Number of rows in table = 12
 
create table student_relation
( Adm_no			char(4) primary key,
  Stud_name	varchar(30) not null,
  gender			char(1)  not null, 
  address			varchar(100) not null,
  mobile_phone char(8) null,
  home_phone  char(8) null,
  DOB				date      not null,
  nationality		varchar(30) not null,
  crse_cd			varchar(5) not null,
  foreign key ( nationality ) References country_relation( country_name),
  foreign key ( Crse_cd ) References Course_relation ( Crse_cd ))
  


Insert into student_relation
values
('A001','Janice','F','127 Clementi Ave 4',null,'61112211','12/11/1990','Singapore','DIT')

Insert into student_relation
values
('A002','Anita','F','326-C Peck Sia Street','91123321','64785623','7/16/1989','Malaysia','DBIT')


Insert into student_relation
values
('A004','Mike','M','79 Clementi South','95566003','63355990','7/10/1989','China','DIT')

Insert into student_relation
values
('A005','Heidi','F','88-A Yi Soon Road',null,'65577111','2/26/1990','Malaysia','DDM')

Insert into student_relation
values
('A006','Keith','M','239 South Bridge Road',null,'64689002','8/19/1990','India','DDM')

Insert into student_relation
values
('A007','Adeline','F','114 Toa Payoh North','95556600','62221155','9/24/1989','Singapore','DDM')

Insert into student_relation
values
('A008','Peter','M','66 Tanglin Ave 3','96343477','65432122','10/30/1989','Singapore','DISM')

Insert into student_relation
values
('A009','Peter','M','53 Dover West',null,'66312254','9/20/1989','Malaysia','DISM')

Insert into student_relation
values
('A010','Derrick','M','4 Boon Lay Way','89098889','64457890','9/8/1990','Korea','DFI')

Insert into student_relation
values
('A011','Joshua','M','67 Yew Tee Road',null,'62089578','7/6/1990','Hong Kong','DFI')

Insert into student_relation
values
('A012','Denise','F','3 Sixth Avenue','81897685','67893467','12/11/1990','Thailand','DFI')

-- One of the rows cannot be inserted into the Student_relation. Why?
-- What must you do to add that row into the Student_relation?
-- Hint:
-- Insert Into country_relation values ('Myanmar', 'Burmese', 'Asia') 

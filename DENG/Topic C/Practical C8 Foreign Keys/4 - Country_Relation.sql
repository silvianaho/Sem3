--DBMS SQL Practical 8 Country_relation
-- Number of rows in table = 8

Create table country_relation
(  country_name  varchar(30) primary key,
   language      varchar(30) not null,
   region        varchar(30) not null)

Insert into country_relation
values 
('China','Chinese','Asia')

Insert into country_relation
values 
('Hong Kong','Cantonese','Asia')

Insert into country_relation
values 
('India','Tamil','Asia')

Insert into country_relation
values 
('Korea','Korean','Asia')

Insert into country_relation
values 
('Malaysia','Malay','Asia')

Insert into country_relation
values 
('Singapore','English','Asia')

Insert into country_relation
values 
('Taiwan','Chinese','Asia')

Insert into country_relation
values 
('Thailand','Thai','Asia')


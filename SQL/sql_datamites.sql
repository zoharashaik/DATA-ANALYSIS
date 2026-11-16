-- This is a single line comment

/* This
is a 
multi line 
comment */

-- Creating a database
create database may11;

create database u1;

-- Deleting a database
drop database u1;

show databases;

-- Selecting a database
use may11;

-- Creating a table
create table student_info(stu_id int, stu_name varchar(30), stu_age tinyint);

-- show a table
select * from student_info;

-- Describe a table
desc student_info;

use may11;
select *  from student_info;

-- Inserting data into table
insert into student_info values(1, "ABC", 21);
select * from student_info;
insert into student_info values(2, "XYZ", 23);

-- deleting a table
drop table student_info;

-- creating a db 
create table patients (p_id int, p_name varchar(50), age tinyint);
select * from patients;
-- inserting
insert into patients values (1, "AA", 21);
insert into patients values (2, "BB", 23);
insert into patients values (3, "Cc", 24);
insert into patients values (4, "DD", 28);
select * from patients;

-- Updating
set sql_safe_updates=0;
update patients set age = 30 where p_id = 1;
select * from patients;
update patients set p_name = "GG" where p_id = 4;
select * from patients;

-- deleting rows
delete from patients where p_id = 3;
delete from patients where p_name  = "BB";
select * from patients;
delete from patients; -- totally  deletes the values in rows nd columns but not the whole table
insert into patients values(5, "CC", 34),(6,"DD", 35);
select * from patients;

 -- Truncate (deletes all the data at a time)
 truncate table patients;
 
 insert into patients values (1, "TT", 36),(2,"SZ", 32);
 select * from patients;
 
 -- Altering (if we want to perform column wise any operations we go with a alter )
 alter table patients drop column age;
 select * from patients;

-- adding column using alter
alter table patients add contact int;
select * from patients;

-- changing the datatype of a column using alter
alter table patients modify contact varchar(20);
desc patients;

-- Renaming a column using  alter
alter table patients  rename column contact to p_contact;
select * from patients;

--




-- select 
select*from titanic;
select name, fare, cabin, age from titanic;
select embarked from titanic;

-- distinct(unique values)
select  distinct(sibsp) from titanic;
select distinct(embarked) from titanic;

-- where
select * from titanic where embarked = 'Q';
select * from titanic where embarked = 'S';
select * from titanic where embarked = 'C';

select survived, age,pclass from titanic where age>60;
select survived, age,pclass from titanic where age>60 and 
Survived =1; 

select survived, age,pclass from titanic  where fare<5;
select survived, name ,ticket,fare  from titanic  where fare<5;
select fare, ticket,age, embarked from titanic where age<=10 and embarked ="c";
select fare, ticket,age, embarked from titanic where age<=10 or embarked ="c";
select * from titanic where not(age)<10;

-- Assignment:
-- How  many unique values are there in parch column;
select distinct(parch) from titanic;
-- How many members are survied?
select * from titanic where survived=1;
-- how many males are survived
select*from titanic where survived and gender ="male";
-- how many females are survived
select*from titanic where survived and gender ="female";

-- order by
select*from titanic;
select *from titanic order  by age  ;
select *from titanic order  by age  desc;
select age, name, embarked from titanic where age>70 order by name;
select age, name, embarked from titanic where age>70 order by name desc ;

-- Assingment
-- who is the person got highest fare?
select * from  titanic  order by fare;
select * from  titanic  order by fare desc;
-- who is the person got least fare?
select * from  titanic  order by fare desc;

use may11;
-- isnull/isnotnull
select * from titanic where age is null;
select * from titanic;
select * from titanic where age is not null;
select * from titanic where embarked is null;

-- Limit(row level operation)
select age, name, embarked from titanic where age > 70;
select age, name, embarked from titanic where age > 70 limit 2;
select * from titanic where age > 65 order by age;
select * from titanic where age > 65 order by age
desc limit  5;
select * from titanic order by  fare desc limit 1;
select * from titanic order by age limit 1;

-- in
select distinct(sibsp) from titanic;
select * from titanic where sibsp = 4;
select * from titanic where sibsp = 4 or sibsp = 1 or sibsp = 0;-- To overcome this in operator used
select * from titanic where  sibsp in (4,0,1);
select distinct(embarked) from titanic;
select * from titanic where embarked = "Q";
select * from titanic where embarked in ("c","q");  

-- and
select * from titanic where pclass = 2 and embarked  = "S";

--  Between
select * from titanic where age between 50 and 65;
select * from titanic where passengerid between  50 and 100;

-- like
select * from titanic where name like "s%";-- Name starts wth s and end with any of letter, % returns n umber of alphabets
select * from titanic where name like "%d";
select * from titanic where name like "w%d";-- name starts with w and ends wth d
select * from titanic where name like "h%d";
select * from titanic where name like "m_";-- name having only 2 letters starts wth m
select * from titanic where name like "he%d";
select * from titanic where name like "%mis%";

-- AGGREGATE FUNCTIONS
-- Count
select count(age) from titanic;
select count(age) from titanic where age = 30;
select count(embarked) from titanic where embarked = "q";

-- Sum
select sum(age) from titanic where age = 30;
select sum(age) from titanic where embarked = "Q";

-- avg
select avg(age) from titanic;

-- min
select min(fare) from titanic;

-- max
select max(fare) from titanic;

-- task
-- what is avg  fare in embarked stations s and q
select avg(fare) from titanic where embarked in ("S","Q");

-- group by
select distinct(embarked) from titanic;
select embarked, avg(fare) from titanic group by  embarked;
select distinct(pclass) from titanic;
select pclass, max(fare) from titanic group by pclass;
select pclass, min(fare) from titanic group by pclass;
select pclass, avg(fare) from titanic group by pclass;
select pclass, avg(fare) from titanic group by pclass having (fare) > 50;
select gender, count(gender) from titanic group by gender;

select * from titanic;
select distinct(sibsp) from titanic;

-- having
select sibsp, avg(fare) from titanic group by sibsp;
select sibsp, avg(fare) from titanic group by sibsp
order by sibsp;
select sibsp, avg(fare) from titanic group by sibsp
having avg(fare) >35 order by sibsp;
select embarked, max(age) from titanic group by embarked having max(age) > 40;

-- subquery 
select min(age) from titanic;
select * from titanic where age = '0'; 
select * from titanic where age = 
(select  min(age) from titanic);

select  min(fare) from titanic ;
select * from titanic where fare = 
(select  min(fare) from titanic);

-- joins
create table employee(
emp_id varchar(20),
ename varchar (10),
salary int
);
create table department(
dep_id varchar(10),
dname varchar(20)
);
select * from employee;
select * from department;
insert into employee values
('E1','john',45000,'D1'),
('E2','mary', 60000,'D2'),
('E3','steve',73000,'D3'),
('E4','helen',86000,'D4'),
('E5','joe',350000,'D7');
select * from employee;

insert into department values
('D1','IT'),
('D2','HR'),
('D3','Admin'),
('D4','Finance'),
('D5','sales');
select * from department;

-- Inner join
select emp_id,ename,salary,employee.dep_id,dname from employee inner join department
on employee.dep_id = department.dep_id;

-- Left join
select emp_id,ename,salary,employee.dep_id,dname from employee left join department
on employee.dep_id = department.dep_id;

-- Right join
select emp_id,ename,salary,employee.dep_id,dname from employee right join department
on employee.dep_id = department.dep_id;

-- Full outer join
select emp_id,ename,salary,employee.dep_id,dname from employee left join department
on employee.dep_id = department.dep_id
union
select emp_id,ename,salary,employee.dep_id,dname from employee right join department
on employee.dep_id = department.dep_id;

-- Cross join
select e.emp_id,e.ename,d.dep_id,d.dname
from employee e
cross join department d;

-- self join
select
A.emp_id as Emp1_ID,A.ename as Emp1_Name,
B.emp_id as Emp2_ID,A.ename as Emp2_Name,
A.dep_id
from employee A
join employee B
on A.dep_id = B.dep_id
where A.emp_id <= B.emp_id;

-- Constraints(rules of creating a table)
-- 6 types of constraints(uniquq,primary,foreign key,check,default,not null)
-- primary key - it does not accept duplicate, it doesnt accept null values
-- foreign key - it accept duplicates and also null values
-- unique key - it accepts unique values, null values and reject to accept dupliactes
-- not null - it does not accept the null values , it may accepts the duplicates
-- check - it checks the conditiion only
-- default - (Default values act like rules to ensure consistency without needing manual input every time) 

-- constarints 

create table students(
stu_id int primary key,
first_name varchar(50) not null,
last_name varchar(50) not null,
email varchar(100) unique,
age int check (age >= 20),
gender char(1) default "m"
);

select * from students;
desc students;
insert into students
(stu_id,first_name,last_name,email,age,gender)
values(1,"a","b","ab@gmail.com",22,"f");
select * from students;
insert into students values
(2,"e","f","ef@gmail.com",23,"f"),
(3,"g","h","gh@gmail.com",24,Default),
(4,"i","j","ij@gmail.com",25,"f");

select * from students;

insert into students
values(5,"s","z","sz@gmail.com",22,"m");

select * from students;

insert into students
values(6,"Z","S","ZS@gmail.com",23,"f");

select * from students;

	














																																																																																																												
























































 




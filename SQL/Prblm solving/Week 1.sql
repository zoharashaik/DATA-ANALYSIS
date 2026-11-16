 
 
--Week 1: Basics – SELECT, WHERE, ORDER BY, LIMIT, Aliasing 
--Introduction to Databases & SQL 
 
--SELECT statements to retrieve data 
--Filtering with WHERE (AND, OR, BETWEEN, IN, LIKE) 
--Sorting results with ORDER BY 
--Limiting results with LIMIT & OFFSET 
--Aliasing columns and tables 


-- Q1. Create and Insert Data. Create a table named Employees with the following columns: 
-- EmployeeID,Name,Department,Salary,JoiningDate.
create table Employees (
	EmployeeID int not null,
	Name varchar(50) not null,
	Department varchar(50) not null,
	Salary int not null,
	JoiningDate date
);

insert into Employees(EmployeeID, Name, Department, Salary, JoiningDate)
values
	(1, 'Rohith', 'IT', 28000, '2024-06-06'),
	(2, 'Rakshith', 'Mechanical', 23000,  '2024-09-09'),
	(3, 'Abheer', 'Electrical', 25000, '2023-08-08'),
	(4, 'Mohith', 'IT', 35000, '2023-08-22');


--Q2. Select all columns from the Employees table.
select * from Employees;

--Q3. Display only Name and Department columns. 
select Name,Department
from Employees;

--Q4. Show all employees who work in the IT department.
select * from Employees
where Department = 'IT';

--Q5. Retrieve employees with a Salary greater than 45,000.

UPDATE Employees
SET Salary = 45000,
    JoiningDate = '2020-01-01'
WHERE EmployeeID = 1;

Select * from Employees 
where Salary > 45000;

-- Q6. Show employees who joined after 2020-01-01. 

select * from Employees
where JoiningDate > '2020-01-01';

-- Q7. Retrieve employees with a salary between 40,000 and 55,000. 

select * from Employees
where Salary between 40000 and 50000;	

-- Q8. Display employees whose department is either HR or Finance. 

insert into Employees(EmployeeID, Name, Department, Salary, JoiningDate)
values
	(5, 'Ramesh', 'HR', 50000, '2022-01-01'),
	(6, 'Suresh', 'Finance', 45000,  '2020-01-04');
	
select Name,Department
from Employees
where Department in ('HR','Finance');

-- Q9. Retrieve employees whose name starts with 'S'. 

select * from Employees
where Name like 'S%';

-- Q10. Show employees whose name ends with 'a'. 

select * from employees 
where Name like '%a';

-- Q11. Display employees ordered by salary in descending order.

select Name,Salary 
from Employees
order by Salary desc;

-- Q12. Display the first 3 employees based on joining date.

select TOP 3 *
from Employees
order by JoiningDate asc;

-- Q13. Retrieve employees skipping the first 2 rows using OFFSET. 

-- whenever we use offset there must be order by
select * from Employees
order by EmployeeID
offset 2 rows;

-- Q14. Show employee names as Employee_Name using alias.

select Name as Employee_Name
from Employees;

-- Q15. Display Department as Dept and Salary as Income.

select Department as Dept,
Salary as Income
from Employees;

-- Q16. Combine aliasing with sorting: Show top 3 highest paid employees with columns Employee_Name and Income.

select top 3 *,
Name as Employee_Name,
Salary as Income
from Employees
order by Salary desc;

-- Q17. Find the highest salary in the Employees table. 

select Max(Salary) as highest_salary
from Employees;

-- Q18. Find the total number of employees in each department.

select 
Department,
count(*) as Total_employees
from Employees
group by Department;

-- Q19. Show the average salary of all employees

select  avg(Salary) as avg_salary
from Employees;

-- Q20. Display the employee(s) with the lowest salary. 

select min(Salary) as Lowest_salary
from Employees;

select * 
from Employees
where Salary = (select min(Salary) from Employees);

select top 1 *
from Employees
order by Salary asc;







--Week 2: GROUP BY, HAVING, Joins (Inner, Left, Right, Full), Subqueries 

--GROUP BY & Aggregation functions (SUM, AVG, COUNT, MAX, MIN) 
--Filtering groups with HAVING 
--INNER, LEFT, RIGHT, FULL Joins – Combining multiple tables 
--Writing Subqueries for filtering and aggregations 

-- Q1. Count how many employees are in each Department. 

select 
Department,
count(*) as Total_employees
from Employees
group by Department;

-- Q2. Find the average salary per department.

select
Department,
avg(Salary) as Avg_Sal
from Employees
group by Department;

-- Q3. Show the highest and lowest salary in each department.

select
Department,
max(Salary) as highest_salary,
min(Salary) as lowest_salary
from employees
group by Department;

-- Q4. Show the total salary paid per department.

select 
Department,
sum(Salary) as total_salary
from Employees
group by Department;

-- Q5. Count how many employees joined in each year (use YEAR(JoiningDate)). 

select 
year(JoiningDate) as joining_year,
count(*) as total_employees
from employees
group by year(JoiningDate)
order by joining_year;

-- Q6. Find departments that have more than 1 employee.

select
Department,
count(*) as total_employees
from Employees
group by Department
having count(*) > 1;

-- Q7. Find departments where average salary > 50,000.

select
Department,
avg(Salary) as avg_salary
from Employees
group by Department 
having avg(Salary) > 50000;

-- Q8. Find joining years where more than 2 employees joined.

select
year(JoiningDate) as joining_year,
count(*) as total_employees
from Employees
group by year(JoiningDate)
having count(*) > 2;

-- Q9. Perform an INNER JOIN to show Employee Name with their Department Manager. 

create table Manager(
	Name varchar(40),
	Department varchar(40),
	Salary int 
);

insert into Manager(Name,Department,Salary)
values
	('Rohitha','IT',80000),
	('Mizba','Electrical',60000),
	('Saba','Mechanical',55000);

alter table Manager
add ManagerId int;

alter table Manager
drop column id;

select * from Manager;

--update Manager
--set ManagerId = 1
--where Name = 'Rohitha'

--update Manager
--set ManagerId = 2
--where Name = 'Mizba';

--update Manager
--set ManagerId = 3
--where Name = 'Saba';

select
	e.Name,
	e.Department,
	m.Name as Dept_manager
from Employees as e
inner join Manager as m
on e.EmployeeID = m.ManagerId;

-- Q10. Perform a LEFT JOIN to list all employees and their managers, even if manager info is missing.

select *
from Employees as e
left join Manager as m
on e.EmployeeID = m.ManagerId;

-- Q11. Show total salary per department using JOIN + GROUP BY.

select
Department,
sum(Salary) as total_salary
from Employees
group by Department;

select 
e.Department,
sum(e.Salary) as total_salary
from Employees as e
inner join Manager as m
on e.Department = m.Department
group by e.Department;

-- Q12. Find the employee with the highest salary using a subquery.

select *
from Employees
where Salary = (
	select max(Salary)
	from Employees
);

-- Q13. Find all employees who earn more than the average salary. 

select *
from Employees
where Salary > (
	select avg(Salary) 
	from Employees
);

-- Q14. Find the second highest salary using a subquery. 

select max(Salary) as second_highest_salary
from Employees
where Salary < (
	select max(salary) 
	from Employees
);

-- Q15. Find employees who joined after the employee with the lowest salary.

select * 
from Employees
where JoiningDate > (
	select JoiningDate
	from Employees
	where Salary = (
		select min(Salary)
		from Employees
	)
);

-- Q16. List all departments that have any employee earning more than 60,000. 

select distinct Department
from Employees
where Department in (
	select Department
	from Employees 
	where Salary > 60000
);

-- Q17. Find the total number of employees and total salary in each department.

select 
Department,
count(*) as total_employees,
sum(Salary) as total_salary
from Employees
group by Department;

-- Q18. List all employees whose salary is the maximum in their department.

select *
from Employees as e
where Salary = (
	select max(Salary) 
	from Employees
	where Department = e.Department
);

-- Q19. Show all departments where no employee earns less than 45,000 (use HAVING). 

select
Department,
min(Salary) as min_salary
from Employees
group by Department
having min(Salary) >= 45000;
	
-- Q20. Find employees whose joining year is the same as any HR department employee (use subquery).

select
* from Employees
where year(JoiningDate) in (
	select Year(JoiningDate)
	from Employees
	where Department = 'HR'
);



	























SELECT 
OrderID,
OrderDate,
Shipdate,
CreationTime
FROM Sales.Orders;

--Date column from a table(1st way in order to query the date)
SELECT 
OrderID,
CreationTime
FROM Sales.Orders;

--Hardcoded constant string value
SELECT
OrderID,
Creationtime,
'2026-06-09' Hardcoded
FROM Sales.Orders;

--GetDate() function
SELECT
OrderID,
Creationtime,
'2026-06-09' Hardcoded,
GETDATE() today
FROM Sales.Orders;

--Part extraction of date 
SELECT
OrderID,
CreationTime,
--DATETRUNC EXAMPLES
DATETRUNC(day,Creationtime) day_dt,
DATETRUNC(minute,Creationtime) minute_dt,
DATETRUNC(year,Creationtime)year_dt,
--DATENAME EXAMPLES
DATENAME(month, CreationTime) month_dn,
DATENAME(weekday, CreationTime) weekday_dn,
DATENAME(day, CreationTime) day_dn,
--DATEPART EXAMPLES
DATEPART(Year, CreationTime) year_dp,
DATEPART(month, CreationTime) month_dp,
DATEPART(day, CreationTime) day_dp,
DATEPART(hour , CreationTime) hour_dp,
DATEPART(quarter, CreationTime) quarter_dp,
DATEPART(week, CreationTime) week_dp,
YEAR(CreationTime) AS year,
MONTH(CreationTime) Month,
DAY(CreationTime) day 
FROM Sales.Orders;

--Why is DATETRUNC MORE IMPORTANT
SELECT 
DATETRUNC(month, creationtime) creation,
COUNT(*)
FROM sales.orders
GROUP  BY DATETRUNC (month, creationtime);

--Why is DATETRUNC MORE IMPORTANT
SELECT 
DATETRUNC(year, creationtime) creation,
COUNT(*)
FROM sales.orders
GROUP  BY DATETRUNC (year, creationtime);

--EOMONTH()
SELECT 
orderid,
creationtime,
EOMONTH(creationtime) Endofmonth
FROM sales.orders;

SELECT
orderid,
creationtime,
DATETRUNC(month, creationtime) startofmonth
FROM sales.orders;

--To remove zeroes from a start of month
SELECT
orderid,
creationtime,
CAST(DATETRUNC(month, creationtime) AS date)startofmonth
FROM sales.orders;  

--How many orders were placed each year?
SELECT 
year(Orderdate),
count(*) nroforders
from sales.orders
group by year(orderdate);

--part agggregation usecase(data aggregations)
--How many orders were placed each month?
SELECT 
month(Orderdate),
count(*) nroforders
from sales.orders
group by month(orderdate);

--if we wanna full name of the month
SELECT 
DATENAME(month, Orderdate) AS orderdate,
count(*) nroforders
from sales.orders
group by DATENAME(month,orderdate);

--part extracation usecases(data filtering)
--Show all orders that were placed during a month of febraury
select 
*
from sales.orders
where month(orderdate) = 2;

--Format() examples
SELECT
orderid,
creationtime,
FORMAT(creationtime, 'MM-dd-yyyy') US_format,
FORMAT(creationtime,'dd-MM-yyyy') EURO_format,
FORMAT(creationtime, 'dd') dd,
FORMAT(creationtime, 'ddd') ddd,
FORMAT(creationtime, 'dddd') dddd,
FORMAT(creationtime, 'MM') MM,
FORMAT(creationtime, 'MMM') MMM,
FORMAT(creationtime, 'MMMM')MMMM
from sales.orders;

--SQL task
--show creationn time using the following format 'Day Wed Jan Q1 2025 12:34:56 PM
select
orderid,
creationtime,
'Day ' + FORMAT(creationtime, 'ddd MMM') +
' Q' + DATENAME(quarter, creationtime) + ' ' +
FORMAT(creationtime, 'yyyy hh:mm:ss tt') AS customeformat
from sales.orders;

--Formatting usecases(data aggregations)
select 
orderdate,
count(*)
from sales.orders
group by orderdate;

-- by aggregating this data
select
format(orderdate, 'MMM yy') as order_date,
count(*)
from sales.orders
group by format(orderdate, 'MMM yy');

--Convert() examples
SELECT 
CONVERT(INT, '123') AS [string to int CONVERT],
CONVERT(DATE, '2025-06-06') AS [string to date CONVERT],
creationtime,
CONVERT(DATE, creationtime) AS [datetime to date convert],
CONVERT(VARCHAR, creationtime, 32) AS [USA std. style:32],
CONVERT(VARCHAR, creationtime, 34) AS [EURO std. style:34]
from sales.orders;

--CAST() examples
SELECT
CAST('123' AS INT) AS  [STRING TO INT],
CAST(123 AS VARCHAR) AS [INT TO STRING],
CAST('2026-06-11' AS DATE) AS [STRING TO DATE],
CAST('2026-06-11' AS DATETIME2) AS [STRING TO DATETIME],
Creationtime,
CAST(creationtime AS DATE) AS [DATETIME TO DATE]
FROM sales.orders;

--DATEADD()
select
orderid,
orderdate,
dateadd(day, -10, orderdate) AS [BEFORE 10 DAYS],
dateadd(month, 3, orderdate) AS [THREE MONTHS LATER],
dateadd(year, 2, orderdate) AS [TWO YEARS LATER]
FROM sales.orders

--DATEDIFF()
-- Calculate the age of employees
SELECT  
employeeid,
birthdate,
datediff(year, birthdate, GETDATE()) AS Age
from sales.employees;

--Find the average shipping duration in days for each month
select 
orderid,
orderdate,
shipdate,
datediff(day, orderdate, shipdate) as dayduration
from sales.orders;

select 
month(orderdate) as orderdate,
avg(datediff(day, orderdate, shipdate)) as avgship
from sales.orders
group by month(orderdate)

--Time gap analysis
--Find the number of days between each order and the previous order
--BY  USING LAG FUNCTION WE CAN 
select 
orderid,
orderdate as currentorderdate,
LAG(orderdate) OVER (ORDER BY orderdate) previousorderdate,
datediff(day, LAG(orderdate) OVER (ORDER BY orderdate) , orderdate) as nrofdays
from sales.orders;

--ISDATE
--let us check the string is date or not
select
isdate('123') datecheck,
isdate('2025-08-20') datecheck1,
isdate('20-08-2025') datecheck2,--RETURNS 0 BCOZ SQL ONLY UNDERSTANDS y-m-d format
isdate('2025') datecheck3,
isdate('08') datecheck4;

SELECT
	--CAST(orderdate as DATE) orderdate
	orderdate,
	ISDATE(orderdate),
	CASE WHEN ISDATE(orderdate) = 1 THEN CAST(orderdate as DATE)
		ELSE '9999-01-01'
	END Neworderdate
FROM
(
	SELECT '2025-08-20' AS orderdate UNION
	SELECT '2025-08-21' UNION
	SELECT '2025-08-23' UNION
	SELECT '2025-08'
)t
--WHERE ISDATE(orderdate) = 0




















 











 
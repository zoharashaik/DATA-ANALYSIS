-- WINDOW AGGREGATE FUNCTIONS
--COUNT()

-- Find the total number of orders
--Find the total number of orders for each customers
--Additionally provide details such orderid and orderdate
select
orderid,
orderdate,
customerid,
count(*) over() Totalorders,
count(*) over(partition by customerid) orderbycust
from sales.orders;

--Find the total number of customers
--Additionally provide all customer details
select
*,
count(*) over() totalcustomers
from sales.customers;

--Find the total number of scores for the customers
select
score,
count(score) over() totalscores,
count(country) over() totacountries
from sales.customers;

--check whether the table 'orders' contains any duplicate rows
select
orderid,
count(*) over(partition by orderid) checkPK
from sales.orders

select
orderid,
count(*) over(partition by orderid) checkkey
from sales.ordersarchive

--if we wanna select exact duplicate numbers to be displayed
select
*
from (
	select
	orderid,
	count(*) over(partition by orderid) checkkey
	from sales.ordersarchive
)t where checkkey > 1;

--SUM()

--Find the total sales across all orders
--And the total sales for each product
--Additionally provide such  details orderid,orderdate
select
orderid,
orderdate,
productid,
sales,
SUM(sales) over() totalsales,
SUM(sales) over(partition by productid) as salesbyproduct
from sales.orders;

--COMPARITIVE ANALYSIS(PART-TO-WHOLE ANALYSIS)
--Find the ppercentage contribution of each product's sales to the total sales
select
orderid,
productid,
sales,
SUM(sales) over() totalsales,
ROUND (cast (sales as FLOAT)/ SUM(sales) over() *  100,2) as percentageoftotal
from sales.orders;

--AVG()

--Find the average sales across all orders
--And find the average sales for each product
--Additionally provide details such as orderid,orderdate
select
orderid,
orderdate,
productid,
sales,
AVG(sales) over() as avgsales,
AVG(sales) over(partition by productid) as salesbyproduct
from sales.orders;

--Find the average scores of customers
--Additionally provide details such customerid and lastname
select
customerid,
lastname,
score,
coalesce(score, 0) customerscore,
avg(coalesce(score, 0)) over() avgtotalscores
from sales.customers;

--Find all orders where sales are higher than the average sales across all orders

select
*
from (
	select
	orderid,
	productid,
	sales,
	AVG(sales) over() avgsales
	from sales.orders
)t where sales > avgsales;

--Find the highest and lowest sales across all orders
--and the highest and lowest sales for each product
--additionally provide details such as orderid and orderdate
select
orderid,
orderdate,
productid,
sales,
max(sales) over() as maxsales,
min(sales) over() as minsales,
max(sales) over(partition by productid) maxsalesbyproduct,
min(sales) over(partition by productid) minsalesbyproduct
from sales.orders;

--Show the employees with the highest salaries
select
*
from(
	select
	*,
	max(salary) over() as highestsalary
	from sales.employees
)t where salary = highestsalary;

--Find the deviation of each sales from the minimum and maximum sales amount
select
	orderid,
	orderdate,
	productid,
	sales,
	max(sales) over() highestsales,
	min(sales) over() lowestsales,
	sales - min(sales) over() deviationfromin,
	max(sales) over() - sales deviationfromax
from sales.orders;

--Calculate moving average of sales for each product over time
select
orderid,
productid,
orderdate,
sales,
avg(sales) over(partition by productid) avgbyproduct,
avg(sales) over(partition by productid order by orderdate) movingavg
from sales.orders;

--Calculate moving average of sales for each product over time,including the next order
select
orderid,
productid,
orderdate,
sales,
avg(sales) over(partition by productid) avgbyproduct,
avg(sales) over(partition by productid order by orderdate  rows between current row and 1 following) rollingavg
from sales.orders;


									




 
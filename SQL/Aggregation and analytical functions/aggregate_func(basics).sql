-- Find the total number of orders
/*select
* 
from orders;

select
count(*) as total_nr_orders
from orders;

--Find the  total sales of all orders
select
count(*) as total_nr_orders,
SUM(sales) as total_sales
from orders;

--Find average sales of all orders
select
count(*) as total_nr_orders,
SUM(sales) as total_nr_sales,
AVG(sales) as avg_sales
from orders;

--Find the highest sales of all orders
select
count(*) as total_nr_orders,
SUM(sales) as total_nr_sales,
AVG(sales) as avg_sales,
MAX(sales) as highest_sales
from orders;

--Find the lowest sales of all orders
select
count(*) as total_nr_orders,
SUM(sales) as total_nr_sales,
AVG(sales) as avg_sales,
MAX(sales) as highest_sales,
MIN(sales) as lowest_sales
from orders;

-- if we apply groupby then it is gng to break the big nuumbers into more details based on given column
select
customer_id,
count(*) as total_nr_orders,
SUM(sales) as total_nr_sales,
AVG(sales) as avg_sales,
MAX(sales) as highest_sales,
MIN(sales) as lowest_sales
from orders
group by customer_id;

--Analyze the scores in customer table
select 
count(*) as total_nr_customers,
sum(score) as total_score,
avg(score) as avg_score,
max(score) as highest_score,
min(score) as lowest_score
from customers; */

-- WHY WE NEED WINDOW FUNCTIONS
-- WHY GROUP BY IS NOT ENOUGH


--Find the total sales across all orders
select
SUM(sales) as totalsales
from sales.orders

--Find the total sales for each product
select
productid,
SUM(sales) as totalsales
from sales.orders
group by productid

--Find the total sales for each product
--Additionally provide details such orderid and orderdate
select
orderid,
orderdate,
productid,
SUM(sales) as totalsales
from sales.orders
group by 
	orderid,
	orderdate,
	productid
--RULE : all columns must be include in group by which r mentioned in select
--But here total sales column aggregation is destroyed

--By using window function
select
orderid,
orderdate,
productid,
SUM(sales)  over(partition by productid) totalproductsales
from sales.orders;

--Find the total sales across all orders
--Additionally provide details such orderid and orderdate
select
orderid,
orderdate,
SUM(sales) over() totalsales
from sales.orders;

--Find the total sales for each product
--Additionally provide details such orderid and orderdate
select
orderid,
orderdate,
productid,
sales,
SUM(sales) over(PARTITION BY productid) totalsalesbyproduct
from sales.orders

--Find the total sales for each combination of product and order status
select
orderid,
orderdate,
orderstatus,
productid,
sales,
SUM(sales) over() totalsales,
SUM(sales) over(PARTITION BY productid) totalsalesbyproduct,
SUM(sales) over(PARTITION BY productid, orderstatus) salesbyproductandstatus
from sales.orders;

--Rank each order based on their sales from highest to lowest
--Additionally provide details such orderid and orderdate
select
orderid,
orderdate,
sales
from sales.orders
order by sales desc;
--By using window function
select
orderid,
orderdate,
sales,
RANK() OVER(ORDER BY sales desc) ranksales
from sales.orders;

select
orderid,
orderdate,
orderstatus,
sales,
SUM(sales) over(partition by orderstatus order by orderdate
ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING) totalsales
from sales.orders

--Find the total sales for each order status only for 2 products 101 and 102
select
orderid,
orderdate,
orderstatus,
productid,
sales,
SUM(sales) over(partition by orderstatus) Totalsales
from sales.orders
where productid in (101,102);

--Rank the customers based on their total sales
select
customerid,
SUM(sales) as Totalsales,
RANK() over(order by sum(sales) desc) rankcustomers
from sales.orders
group by customerid;






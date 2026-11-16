-- sub Queries
-- sub queries categories
-- result types

-- SCALAR subquery returns only single value
select
AVG(sales)
from sales.orders;

-- ROW sub QUery returns single column wth multiple rows
select
customerid
from sales.orders;

-- TABLE sub Query returns multiple rows wth multiple columns
select
*
from sales.orders;

-- LOCATION | CLAUSES
-- Sub Query in from clause

-- Find the products that have a higher price than the average price of all products

-- Main Query
select
* 
from
	-- Sub Query
	(select
	productid,
	price,
	Avg(price) over() Avgprice
	from sales.products)t
where price > Avgprice;

--Rank customers based on their total amount of sales
select
*,
rank() over(order by totalsales desc) CustomerRank
from
	(select
	customerid,
	SUM(sales) Totalsales
	from sales.orders
	group  by customerid)t


-- Sub Query in select clause

-- Show the product ids, product names, prices and total number of orders

-- Main query
select
	productid,
	product,
	price,
    -- sub query
	(select count(*) from sales.orders) as  totalorders
from sales.products;

-- Sub Query in JOIN clause

-- Show all customer details and find the total orders of each customer

-- Main query
select
c.*,
o.totalorders
from sales.customers c
left join(
	-- Sub Query
	select
	customerid,
	count(*) totalorders
	from sales.orders
	group by customerid) o
on c.customerid = o.customerid;

-- SubQuery in WHERE clause

-- Find the products higher that have a higher price than the average price of all products
select
productid,
price,
(select avg(price) from sales.products) as avgprice
from sales.products
where price > (select avg(price) from sales.products)

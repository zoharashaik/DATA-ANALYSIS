-- isnull/coalesce 
-- handling the null before doing data aggregations
-- Find the average scores of customers
SELECT
customerid,
score,
coalesce(score,0) score2,
avg(score) over () avgscores,
avg(coalesce(score, 0)) over() avgscores2
from sales.customers;

--Display the full name of customers in a single field 
--by merging their first and last names
--and add 10 bonus points to each customers score.
select
customerid,
firstname,
lastname,
coalesce(lastname ,' ') lastname2,
firstname + ' ' + coalesce(lastname ,' ')  as fullname,
score,
coalesce(score, 0)  + 10 as scorewithbonus
from sales.customers;

--isnull/coalesce use cases
-- handling the null before joining tables
-- tables in notebook for this query
/*select 
a.year,a.type,a.orders,b.sales
from table1 a
join table2 b
on a.year = b.year
and a.type = b.type;

-- by handling the nulls for above query
select
from table1 a
join table2 b
on a.year = b.year
and isnull(a.type,' ') = isnull(b.type,' '); */

--handle the null before sorting data
--sort the customers from highest to lowest scores,
--with nulls appearing last
--lazy method to handle the null as per question
select 
customerid,
score,
coalesce(score, 9999)
from sales.customers
order by coalesce(score, 9999);

-- by using the proffessional method
select 
customerid,
score,
case when score is null then 1 else 0 end as flag
from sales.customers
order by case when score is null then 1 else 0 end, score;

-- Find the sales price for each order by dividing sales by  quantity
select
orderid
sales,
quantity,
--sales / quantity as price --if we do this we will get error as divide byzero encountered
sales / nullif(quantity, 0) as price
from sales.orders;

-- Identify the customers who has no scores
select
*
from sales.customers
where score is null;

-- show a list of all customers who have scores
select
* 
from sales.customers
where score is not null;

-- left anti join | right anti join use case
-- finding the unmatched rows between 2 tales

--list all details for customers who have not placed any orders
select 
c.*,
o.orderid
from sales.customers c
left join sales.orders o
on c.customerid = o.customerid
where orderid is null;
--where o.customerid is null


with orders as (
select 1 id,'A' category union
select 2, null union
select 3, '' union
select 4, '  ' )
select 
*,
datalength (category) as categorylen,
datalength(trim(category)) policy1,
nullif(trim(category), ' ') policy2,
coalesce(nullif(trim(category), ' ') , 'unknown') policy3
from orders;





 













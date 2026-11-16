--ROW_NUMBER()

--Rank the orders based on their sales from highest to lowest
select
orderid,
productid,
sales,
row_number() over(order by sales desc) sales_rankrow
from sales.orders;

--RANK()

--Rank the orders based on their sales from highest to lowest
select
orderid,
productid,
sales,
rank() over(order by sales desc) sales_rankrow
from sales.orders;

--DENSE_RANK()

----Rank the orders based on their sales from highest to lowest
select
orderid,
productid,
sales,
DENSE_rank() over(order by sales desc) sales_denserankrow
from sales.orders;

--Row number use case
--TOP-N-analysis(Analyzes the top performers to do targeted marketing

--Find the top highest sales for each product
select *
from (
	select
	orderid,
	productid,
	sales,
	Row_number() over(partition by productid order by sales desc) rankbyproduct
	from sales.orders
)t where rankbyproduct = 1;

--Row number usecase
--Bottom-n-analysis

--Find the lowest 2 customers based on their total sales
select *
from(
	select 
	customerid,
	sum(sales) as totalsales,
	row_number() over(order by sum(sales)) rankbycustomers
	from sales.orders
	group by customerid
)t where rankbycustomers <= 2;

--Row number usecase
--Generate unique id's

--Assign unique id's  to the rows of the 'orders Archive' table
select
row_number() over(order by orderid,orderdate) uniqueid,
*
from sales.ordersarchive;


--Row number usecase
--Identify duplicates

--Identify duplicate rows in a table 'ordersArchive' and return a clean result without duplicates
select *
from(
select
row_number() over(partition by orderid order by creationtime desc) rn, 
*
from sales.ordersarchive
)t where rn = 1;

--NTILE(n)
--TASK
select
orderid,
sales,
ntile(4) over(order by sales desc) Fourbucket,
ntile(3) over(order by sales desc) threebucket, --bucketsize 10/3 = 3.3 so larger grp comes first
ntile(2) over(order by sales desc) twobucket, --bucketsize  10/2 = 5
ntile(1)  over(order by sales desc) bucket -- bucket size  10/1 = 1
from sales.orders

--NTILE() usecase "Data segmentation"

--Segment all orders in 3 categories:high, medium and low sales
select
*,
case when buckets = 1 then 'High'
     when buckets = 2 then 'Medium'
	 when buckets = 3 then 'Low'
end salesSegmentation
from(
	select
	orderid,
	sales,
	ntile(3) over(order by sales desc) Buckets
	from sales.orders
)t;

--NTILE() use case "Equalizing load"

--In  order to export the data, divide the orders in 2 groups
select
ntile(2) over(order by orderid) Bucket,
*
from sales.orders;

--CUME_DIST()
--PERCENT_RANK()

--Find the products that fall within the highest 40% of prices
select
*,
concat(dist_rank * 100 ,'%') distRankPerc
from(
	select
	product,
	price,
	cume_dist() over(order by price desc) Dist_rank
	from  sales.products
)t where Dist_rank <= 0.4 


	






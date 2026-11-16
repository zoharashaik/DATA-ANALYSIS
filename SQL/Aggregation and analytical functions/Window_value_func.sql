--LEAD()/LAG() usecase
--Month over month analysis
--month() --> extracts and returns the month from the given date

--Analyze the month-over-month performance by finding the percentage change in sales
--between the current and previous months
select
*,
CurrentMonthSales - PreviousMonthSales as MoM_Change,
round(cast(CurrentMonthSales - PreviousMonthSales as float)/PreviousMonthSales * 100, 1)
from(
select
	month(orderdate) orderMonth,
	sum(sales) CurrentMonthSales,
	lag(sum(sales)) over (order by month(orderdate)) PreviousMonthSales
from sales.orders
group by 
	month(orderdate)
)t;

-- LEAD/LAG usecase
-- Customer Retention Analysis

-- In order to analyze customer loyalty,
-- rank customers based on the average days between the orders
-- DATEDIFF --> calculates the difference between two date values
-- COALESCE() --> Replaces nulls by returning the first non null value from a list
select
customerid,
avg(DaysUntillNxtOrder) Avgdays,
rank() over(order by coalesce( avg(DaysUntillNxtOrder) , 9999)) Rankavg
from(
	select
	orderid,
	customerid,
	orderdate,
	lead(orderdate) over(partition by customerid order by orderdate) Nxtorder,
	datediff(day,orderdate, lead(orderdate) over(partition by customerid order by orderdate)) DaysUntillNxtOrder
	from sales.orders
)t
group by
customerid

-- FIRST_VALUE()/LAST_VALUE()

--Find lowest and highest sales for each product
-- Find the difference in sales between the current and the  lowest sales
select
orderid,
productid,
sales,
first_value(sales) over(partition by productid order by sales) Lowestsales,
last_value(sales) over(partition by productid order by sales rows between current row and unbounded  following) Highestsales,
first_value(sales) over(partition by productid order by sales desc) highestsales,
min(sales) over(partition by productid) lowestsales,
max(sales) over(partition by productid) highestsales,
sales - first_value(sales) over(partition by productid order by sales) SalesDifference
from sales.orders;





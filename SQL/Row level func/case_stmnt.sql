--CASE STMNT

-- Generate a report showing the total sales for each category
/* - High if the sales higher than 50
   - Medium if sales between 20 and 50 
   - Low if the sales equual or lower than 20 
sort the result from lowest to highest */
select
category,
SUM(sales) as totalsales
FROM(
	select
	orderid,
	sales,
	CASE
		when sales > 50 THEN 'High'
		when sales > 20 THEN 'Medium'
		ELSE 'Low'
	END category
	from sales.orders
)t
GROUP BY category
ORDER BY totalsales desc;

--Retrieve  employee details with gender displayed as full text
select 
employeeid,
firstname,
lastname,
gender, 
CASE
	WHEN gender = 'M' THEN 'Male'
	WHEN gender = 'F' THEN 'Female'
END as fulltext
from sales.employees;

--Retrieve customer details with abbreviated country code
select distinct country
from sales.customers;

select 
customerid,
firstname,
lastname,
country,
CASE 
	When country = 'Germany' then 'DE'
	when country = 'USA'  then 'US'
	ELSE 'n/a'
END countryAbbr,
CASE country
	When 'Germany' then 'DE'
	when 'USA'  then 'US'
	ELSE 'n/a'
END countryAbbr2
from sales.customers;

select distinct country
from sales.customers;

--Find the average scores of customers and treat nulls as 0
--Additionally provide details such customerid and lastname
select
customerid,
lastname,
score,
CASE 
	WHEN score is null then 0
	else score
end scoreclean,
avg(CASE 
		WHEN score is null then 0
		else score
    end) over () avgscoreclean,
avg(score) over() avgscore	
from sales.customers;

--count how many times each customer has made an order with sales greater than 30
select
customerid,
SUM(CASE	
		when sales > 30 then 1
		else 0
	end) totalordershighsales,
	count(*) totalorders
from sales.orders
group by customerid;





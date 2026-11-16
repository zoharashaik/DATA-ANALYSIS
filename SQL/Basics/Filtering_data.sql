--Retrieve all customers from germany
SELECT *
FROM customers
WHERE country = 'Germany'

--Retrieve all customers who are not  from germany
SELECT *
FROM customers
WHERE country != 'Germany'

--Retrieve all customers with a score greater than 500
SELECT *
FROM customers
WHERE score > 500

--Retrive all customers with a score of 500 or more
SELECT *
FROM customers
WHERE score >= 500

--Retrieve all customers with a score less than 500
SELECT *
FROM customers
WHERE score < 500

--Retrieve all customers with a score  500 or less
SELECT *
FROM customers
WHERE score <= 500

--Retrieve all customers from USA and have a score greater than 500
SELECT *
FROM customers
WHERE country = 'USA' AND score > 500

--Retrive all customers from USA OR with a score greater than 500 
SELECT *
FROM customers
WHERE country = 'USA' OR score > 500

--Retrieve all customers witha score NOT less than 500
SELECT *
FROM customers
WHERE NOT score < 500

--Retrive all customers whose score falls in the RANGE BETWEEN 100 and 500
SELECT *
FROM customers
WHERE score BETWEEN 100 AND 500

SELECT *
FROM customers
WHERE score >= 100 AND score <= 500

--Retrive all customers from either Germany or USA
SELECT *
FROM customers
WHERE country = 'Germany' OR  country = 'USA'

SELECT *
FROM customers
WHERE country IN ('Germany','USA')

--Find all customers whose first_name starts with 'M'
SELECT *
FROM customers
WHERE first_name LIKE 'M%'

--Find all customerss whose name ends with 'n'
SELECT *
FROM customers
WHERE first_name LIKE '%N'

--Find all customers whose first name contains 'r'
SELECT *
FROM customers
WHERE first_name LIKE '%r%'

--Find all customers whose first name has 'r in the 3rd position
SELECT *
FROM customers
WHERE first_name LIKE '__r%'






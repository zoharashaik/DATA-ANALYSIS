--Concatenate firstname and country into one column
--Show a list of customers first names together  with their country in one column
SELECT 
first_name,
country,
CONCAT(first_name,' ', country) AS name_country
FROM customers

--Transform the customers first name  to lower case
SELECT 
first_name,
country,
CONCAT(first_name,' ', country) AS name_country,
LOWER(first_name) AS low_name
FROM customers;

--Transform the customers first name  to upper case
SELECT 
first_name,
country,
CONCAT(first_name,' ', country) AS name_country,
LOWER(first_name) AS low_name,
UPPER(first_name) AS up_name
FROM customers;

--Find the customers whose first_name contains a leading and trailing values 
SELECT
	first_name,
	LEN(first_name) len_name,
	LEN(TRIM(first_name)) trim_len_name,
	LEN(first_name) - LEN(TRIM(first_name)) minus
FROM customers
--WHERE first_name != TRIM(first_name);

--Remove dashes from a phone number
SELECT
'123-456-7890' AS phone,
REPLACE('123-456-7890', '-', '') AS clean_phone;

--Replace file extence from txt to csv
SELECT
'student.txt' AS txt_file,
REPLACE('student.txt', 'txt', 'csv') AS change_extence;

--Calculate the length of each customers firstname
SELECT
first_name,
LEN(first_name) as len_name
FROM customers;

--Retrieve the first two characters of each first_name
SELECT
first_name,
LEFT(first_name,2) AS first_2_name
FROM customers;

SELECT
first_name,
LEFT(TRIM(first_name),2)  AS first_2_name
FROM customers;

--Retrieve the last two characters of each first_name
SELECT
first_name,
RIGHT(first_name,2) AS last_2_name
FROM customers;

--Retrieve a list of customers first_names removing the first character
SELECT
first_name,
SUBSTRING(first_name, 2, 4) AS sub_name
FROM customers;

SELECT
first_name,
SUBSTRING(TRIM(first_name), 2, LEN(first_name))
FROM customers;











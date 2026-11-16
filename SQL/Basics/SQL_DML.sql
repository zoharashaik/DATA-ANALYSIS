--Inserting values in rows and columns
INSERT INTO customers (id, first_name, country, score)
VALUES 
	(6, 'sam', 'USA', NULL),
	(7, 'Anna', NULL, 100)

SELECT * FROM customers

INSERT INTO customers (id, first_name, country, score)
VALUES 
	(8, 'ruhi', 'USA', NULL)
	

--Insert data from customers(sourcetable) into persons(Targetable
INSERT INTO persons(id, person_name, birth_date, phone)
SELECT 
id,
first_name,
NULL,
'UNKNOWN'
FROM customers

SELECT * FROM persons

--Change the score of customer 6 to 0
UPDATE customers
SET score = 0
WHERE id = 6

SELECT * 
FROM customers

--Change the score of customer 10 to 0 and update the country to UK
UPDATE customers
SET score = 0,
    country = 'UK'
WHERE id = 8

SELECT *
FROM customers

--Upadte  all customers with a NULL score by  setting their score to zero
UPDATE customers
SET score = 0
WHERE score IS NULL

--Delete all customers with an ID greater than 5.
DELETE FROM customers
WHERE id > 5

SELECT *
FROM customers

--Delete all data from the persons table
TRUNCATE TABLE persons


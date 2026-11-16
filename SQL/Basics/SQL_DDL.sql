--Create a new table called persons with columns :id, person_name, birth_date, phone
CREATE TABLE persons (
	id INT NOT NULL,
	person_name VARCHAR(50) NOT NULL,
	birth_date DATE,
	phone VARCHAR(15) NOT NULL,
	CONSTRAINT pk_persons PRIMARY KEY (id)--pk_persons only visible to DB thats y its primarykey
)
SELECT * FROM persons

--Add a new column	called email to the persons table
ALTER TABLE persons
ADD email VARCHAR(50) NOT NULL;

--Remove the column phone from the persons table
ALTER TABLE persons
DROP COLUMN phone

SELECT * FROM persons

--Delete the  table persons from the database
--DROP TABLE persons

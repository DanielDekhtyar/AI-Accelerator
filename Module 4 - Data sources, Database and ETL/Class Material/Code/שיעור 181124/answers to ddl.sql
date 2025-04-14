
--1
CREATE TABLE super_heros
(super_id INT,
super_name VARCHAR
	);

SELECT * FROM super_heros
--2
ALTER TABLE super_heros
ADD COLUMN civilian_name VARCHAR;

--3
ALTER TABLE super_heros
RENAME  COLUMN civilian_name TO real_name;

--4
INSERT INTO super_heros
VALUES (1, 'superman', 'Clark Kent'),
		(2 ,'Spiderman', 'Peter Parker');

SELECT * FROM super_heros

--5
CREATE TABLE mugles(m_id, last_name, first_name,job)
AS
SELECT employee_id,last_name, first_name,job_id
FROM employees
WHERE department_id = 30;

SELECT * FROM mugles

--6
ALTER TABLE mugles
ADD COLUMN sal NUMERIC(9,2);
--7
ALTER TABLE mugles
ADD COLUMN address VARCHAR DEFAULT '4 Privet Drive';

SELECT * FROM mugles;
--8
ALTER TABLE mugles
ALTER COLUMN job SET DEFAULT 'Not a wizard';

--9
ALTER TABLE mugles
ALTER COLUMN address SET DATA TYPE INT;

--10
ALTER TABLE mugles
ALTER COLUMN sal SET DATA TYPE VARCHAR;


	
TRUNCATE TABLE mugles;
TRUNCATE TABLE super_heros

DROP TABLE mugles;
DROP TABLE super_heros;


begin;
DROP TABLE locations;
rollback

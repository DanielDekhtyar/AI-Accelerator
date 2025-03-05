/*
DML - Data Manipulation Language
14.11.2024
Daniel Dekhtyar
*/

-- 1
CREATE TABLE my_employees (
    id INT PRIMARY KEY,
    last_name VARCHAR(25),
    first_name VARCHAR(25),
    userid VARCHAR(25),
    salary NUMERIC(9, 2) DEFAULT 1000
);


-- 2
INSERT INTO my_employees
VALUES (1, 'Patel', 'Ralph', 'rpatel', 895);

-- 3
INSERT INTO my_employees (id, last_name, first_name, userid, salary)
VALUES (2, 'Dancs', 'Betty', 'bdancs', 860);

-- 4
SELECT * FROM my_employees;

-- 5
INSERT INTO my_employees (id, last_name, first_name, userid, salary)
VALUES (3, 'Biri', 'Ben', 'bbiri', 1100);
INSERT INTO my_employees (id, last_name, first_name, userid, salary)
VALUES (4, 'Newman', 'Chad', 'cnewman', 750);

-- 6
SELECT * FROM my_employees;

-- 7
UPDATE my_employees
SET last_name = 'Drexler'
WHERE id = 3;

-- 8
UPDATE my_employees
SET salary = 1000
WHERE salary < 900;

-- 9
SELECT * FROM my_employees;

-- 10
DELETE FROM my_employees
WHERE first_name = 'Betty' AND last_name = 'Dancs';

-- 11
SELECT * FROM my_employees;

-- 12
BEGIN;

-- 13
INSERT INTO my_employees
VALUES (5, 'Dardasaba', 'Smurf', 'DardaID', 100);

-- 14
UPDATE my_employees
SET salary = DEFAULT
WHERE last_name LIKE 'D%';

-- 15
SELECT * FROM my_employees ORDER BY id;

ROLLBACK;
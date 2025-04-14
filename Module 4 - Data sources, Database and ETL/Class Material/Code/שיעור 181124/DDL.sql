INSERT INTO departments (department_id, department_name)
VALUES (6, 'MI6');
/*
INSERT INTO departments 
VALUES (6, 'MI6',null,null);

INSERT INTO departments (department_id, department_name,manager_id, location_id)
VALUES (6, 'MI6',null,null);
*/


INSERT INTO employees (employee_id, first_name, last_name,job_id,email, department_id,hire_date)
VALUES (7,'James', 'Bond','SA_REP','jbond@wahtever.co.uk',6, CURRENT_TIMESTAMP);

SELECT e.last_name||', '|| e.first_name||' '||last_name, d.department_name
FROM employees e JOIN departments d USING (department_id)
WHERE d.department_id =6



INSERT INTO employees (employee_id, first_name, last_name,job_id,email, department_id,hire_date)
VALUES 	(9,'James9', 'Bond','SA_REP','9jbond@wahtever.co.uk',6, CURRENT_TIMESTAMP),
		(8,'James8', 'Bond','SA_REP','8jbond@wahtever.co.uk',6, CURRENT_TIMESTAMP),
		(10,'James10', 'Bond','SA_REP','10jbond@wahtever.co.uk',6, CURRENT_TIMESTAMP)

UPDATE employees
SET salary = 10
WHERe employee_id=7

SELECT * FROM employees WHERE employee_id = 7

DELETE FROM departments 
WHERE department_id =6


DELETE FROM employees 
WHERE employee_id in (7,8,9,10)

SELECT * FROM students 
DELETE FROM students


CREATE TABLE cartoons
	(cart_id INT,
	cart_name VARCHAR,
	birth_date DATE DEFAULT CURRENT_TIMESTAMP, 
	tv_show VARCHAR(30),
	salary NUMERIC(8,2) DEFAULT 1);


INSERT INTO cartoons
VALUES (1,'SpongeBob',DEFAULT, 'BSSP',10000)

SELECT * FROM cartoons

INSERT INTO cartoons
VALUES ('b','SpongeBob',DEFAULT, 'BSSP',10000)

ALTER TABLE cartoons
ADD pet VARCHAR(25) ;

ALTER TABLE cartoons
ADD protagonist VARCHAR(25) DEFAULT 'Plancton';

ALTER TABLE cartoons
ALTER COLUMN cart_id 
SET DATA TYPE NUMERIC(8,2)

ALTER TABLE cartoons
ALTER COLUMN salary
DROP DEFAULT

	
ALTER TABLE cartoons
DROP pet;



ALTER TABLE cartoons
RENAME COLUMN salary TO wage

ALTER TABLE carts 
RENAME TO cartoons


ALTER TABLE cartoons
DROP tv_show;

SELECT * FROM cartoons

ALTER TABLE cartoons
ADD pet VARCHAR(25) DEFAULT 'mitsi' ;

ALTER TABLE cartoons
ALTER COLUMN pet 
DROP DEFAULT

ALTER TABLE cartoons
ALTER COLUMN pet 
SET DEFAULT 'Kitsi'

DROP TABLE cartoons

BEGIN;
DROP TABLE departments
ROLLBACK

SELECT * FROM villians
BEGIN;
DROP TABLE villians

ROLLBACK


TRUNCATE TABLE villians



CREATE TABLE my_emps --()
AS
SELECT employee_id, last_name, first_name, salary
FROM employees
WHERE department_id =60;


SELECT * FROM my_emps
DROP TABLE my_emps

CREATE TABLE my_emps --()
AS
SELECT employee_id, last_name||' '|| first_name AS "Full_name", salary
FROM employees
WHERE department_id =60;


SELECT * FROM my_emps
DROP TABLE my_emps




CREATE TABLE my_emps (emp_id, full_name,salary)
AS
SELECT employee_id, last_name||' '|| first_name , salary
FROM employees
WHERE department_id =60;


SELECT * FROM my_emps
DROP TABLE my_emps
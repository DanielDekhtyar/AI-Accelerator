SELECT * FROM students;


INSERT INTO students
VALUES (5,'Daniel', 'Avitalson','2016-06-22','H');

INSERT INTO students (first_name,last_name, id, birthdate)
VALUES ('Ido','Avitalson',7,'2019-07-13');

SELECT * FROM students;

SELECT * FROM departments;

INSERT INTO departments 	(department_id,department_name)
				VALUES 		(7,				'stam') --implicit null

INSERT INTO departments (department_id,department_name,manager_id, location_id)
VALUES (8,'AI/D&D', null,null);--explicit null

INSERT INTO employees (employee_id,last_name,email,hire_date,job_id,department_id)
VALUES (12,'Voldemort','tomriddle@hogwarts.ac.uk',CURRENT_TIMESTAMP,'IT_PROG',7);

select * from employees;


SELECT * FROM students

INSERT INTO students  (id, first_name,last_name,house_id)
SELECT employee_id, first_name,UPPER(last_name),'R'
FROM employees
WHERE department_id =30

begin;	
UPDATE students
SET house_id = 'G';
rollback;

UPDATE students
SET house_id = 'G'
WHERE id =115; 

begin;

SELECT last_name, salary,department_id
FROM employees
WHERE department_id =7;

SELECT * FROM departments

UPDATE employees
SET salary = salary*1.1, department_id = 7
WHERE department_id = 50;
ROLLBACK;

begin;

SELECT last_name, salary,department_id
FROM employees
WHERE department_id =50;


UPDATE employees
SET salary = (SELECT salary FROM employees WHERE employee_id =100)
WHERE department_id = 50;
ROLLBACK;

BEGIN;
select job_id , salary from employees where employee_id =114

UPDATE employees
SET job_id = (select job_id from employees where employee_id =176),
	salary = (select salary from employees where employee_id =205)
WHERE employee_id =114

ROLLBACK
SELECT * FROM students;

BEGIN
UPDATE students
SET birthdate = (select hire_date from employees where employee_id =176)
WHERE last_name =  'Malfoy'
ROLLBACK

update employees
SET department_id =55
where employee_id = 141;


begin;
DELETE FROM students;

SELECT * FROM students
ROLLBACK

DELETE FROM students 
WHERE  id >4

BEGIN;
SELECT * FROM departments
DELETE FROM departments;

ROLLBACK

SELECT * FROM employees
SELECT * FROM departments;

SELECT * FROM students;
INSERT INTO students (id, last_name, first_name, house_id)
SELECT employee_id, last_name, first_name,'G' FROM employees WHERE employee_id =100


INSERT INTO students (id, last_name, first_name, house_id,birthdate)
VALUES (5,'a','b','S', DEFAULT)


SELECT * FROM departments;

INSERT INTO departments (department_id, department_name)
VALUES (DEFAULT, 'Avtala smuya')



SELECT * FROM students;

BEGIN;

DELETE FROM students
WHERE id =100
SELECT * FROM students;

commit

SELECT * FROM students;

BEGIN;

UPDATE students
SET last_name= 'Lily'
WHERE id =5


commit
BEGIN;
DELETE FROM students
WHERE id =5
commit



SELECT * FROM students


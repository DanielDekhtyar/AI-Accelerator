/*
CREATE TABLE my_employees (
    id INT PRIMARY KEY,
    last_name VARCHAR(25),
    first_name VARCHAR(25),
    userid VARCHAR(25),
    salary NUMERIC(9, 2) DEFAULT 1000
);


INSERT INTO my_employees
VALUES (1,'P', 'R','pruserid',4500);


INSERT INTO my_employees (id,last_name, first_name,userid,salary)
VALUES (2, 'y','x','xyid', 5600);



INSERT INTO my_employees
VALUES (3,'Gru', 'xxx','gruid',114500);

INSERT INTO my_employees
VALUES (4,'Betty', 'yyy','Bettyid',114500);

UPDATE my_employees
SET last_name ='Drexler'
WHERE id =3;

SELECT * FROM my_employees

UPDATE my_employees 
SET salary =15000
WHERE salary < 10000;

DELETE FROM my_employees
WHERE last_name = 'Betty'

BEGIN;

INSERT INTO my_employees
VALUES (4,'Dardasaba', 'xxx','dardaid',10);

select * FROM my_employees ORDER BY id

UPDATE my_employees
SET salary  = DEFAULT
WHERE last_name LIKE 'D%';

rollback;

INSERT INTO my_employees
SELECT employee_id, last_name, first_name,email,salary*1.15
FROM employees
WHERE department_id =50


DELETE FROM my_employees
WHERE id >4
*/


BEGIN;
INSERT INTO my_employees
SELECT employee_id, last_name, first_name,email,salary*1.15
FROM employees
WHERE department_id =50;

SAVEPOINT a;

UPDATE my_employees
SET salary = 4001
WHERE salary >4000

ROLLBACK TO a

SELECT * FROM my_employees ORDER BY id

commit;


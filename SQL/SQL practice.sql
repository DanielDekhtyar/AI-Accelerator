/*
SQL Practice
31.10.2024
*/

-- 1
SELECT last_name, job_id, salary AS Sal 
FROM employees;

-- 2
SELECT * 
FROM departments;

-- 3
SELECT employee_id, last_name, 
salary*12 AS "ANNUAL SALARY" 
FROM employees;

-- 4
SELECT * FROM employees;

-- 5
SELECT employee_id, last_name, job_id, hire_date FROM employees;

-- 6
SELECT first_name || ' ' || last_name AS "Full Name", salary AS "Original Salary", salary*1.125 AS "New Salary" FROM employees;

-- 7
SELECT employee_id AS "Emp #", last_name AS "Employee", job_id AS "Job", hire_date AS "Hire Date" FROM employees;

-- 8
SELECT DISTINCT job_id FROM employees


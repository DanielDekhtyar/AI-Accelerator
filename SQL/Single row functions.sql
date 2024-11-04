/*
4.11.2024
By Daniel Dekhtyar
*/

 -- Morning Practice
SELECT first_name || ' is a ' || job_id AS "Name and Job", salary AS "Yearly Salary" 
FROM employees 
WHERE salary*12 BETWEEN 125000 AND 150000 
ORDER BY department_id DESC, first_name ASC;

-- Single row functions

-- 1
SELECT CURRENT_TIMESTAMP AS "Date";

-- 2 
SELECT employee_id AS "ID", 
last_name AS "Last Name", 
ROUND(salary) AS "Salary",
ROUND(salary*1.115) AS "New Salary" FROM employees;

-- 3
SELECT employee_id AS "ID", 
last_name AS "Last Name", 
ROUND(salary) AS "Salary",
ROUND(salary*1.115) AS "New Salary",
ROUND((salary*1.115) - salary) AS "Increase"
FROM employees;

-- 4
SELECT LOWER(last_name) AS "Last Name", 
LENGTH(last_name) AS "Last name length"
FROM employees 
WHERE SUBSTR(LOWER(last_name), 1, 1) IN ('j', 'a', 'm')
ORDER BY last_name ASC;

-- 5
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE last_name LIKE '%a%';
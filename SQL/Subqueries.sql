/*
Subqueries
11.11.2024
Daniel Dekhtyar
*/

-- 1
SELECT last_name, hire_date
FROM employees e
WHERE e.department_id = 
	(SELECT department_id 
	FROM employees e 
	WHERE LOWER(e.last_name) = 'zlotkey')
AND LOWER(e.last_name) != 'zlotkey';

-- 2
SELECT employee_id, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
ORDER BY salary ASC;

-- 3
SELECT employee_id, last_name
FROM employees e
WHERE e.department_id IN
(SELECT e.department_id FROM employees e WHERE LOWER(e.last_name) LIKE '%u%');

--4
SELECT e.last_name, e.department_id, e.job_id
FROM employees e
WHERE department_id IN (SELECT d.department_id FROM departments d WHERE location_id = 1700);

-- 5
SELECT e.last_name, e.salary
FROM employees e
WHERE manager_id = (SELECT e.employee_id 
FROM employees e 
WHERE e.last_name = 'King' AND e.manager_id IS NULL);
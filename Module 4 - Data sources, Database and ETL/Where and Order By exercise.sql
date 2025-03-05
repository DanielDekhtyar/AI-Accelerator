/*
"Where" and "Order By" excercise
31.10.2024
*/

-- 1
SELECT last_name, salary FROM employees
WHERE salary > 12000;

-- 2
SELECT last_name, department_id FROM employees
WHERE employee_id = 176;

-- 3
SELECT last_name, salary FROM employees
WHERE salary
NOT BETWEEN 5000 AND 12000;

-- 4
SELECT last_name, job_id, hire_date FROM employees
WHERE last_name IN ('Matos', 'Taylor')
ORDER BY hire_date ASC;

-- 5
SELECT last_name, department_id FROM employees
WHERE department_id IN (20, 50)
ORDER BY first_name ASC;

-- 6
SELECT last_name AS "Employee", salary AS "Monthly Salary" FROM employees
WHERE salary BETWEEN 5000 AND 12000
AND department_id IN (20,50);

-- 7
SELECT last_name, hire_date FROM employees
WHERE hire_date
BETWEEN '1994-01-01' AND '1994-12-31';

-- 8
SELECT last_name, job_id FROM employees WHERE manager_id = null
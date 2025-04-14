SELECT employee_id, department_id, job_id  FROM job_history  WHERE employee_id =176
UNION ALL
SELECT employee_id, department_id, job_id FROM employees WHERE employee_id =176;

SELECT employee_id, job_id
FROM employees --107
UNION
SELECT employee_id, job_id
FROM job_history--10
ORDER BY 1;

SELECT employee_id, job_id,department_id
FROM employees 
UNION --ALL
SELECT employee_id, job_id, department_id
FROM job_history
ORDER BY 1;



SELECT employee_id, job_id
FROM employees --107
UNION ALL 
SELECT employee_id, job_id
FROM job_history--10
ORDER BY 1;

--UNION ALL

SELECT name FROM villians
UNION ALL
SELECT name FROM favorites

SELECT employee_id, job_id
FROM employees --107
UNION ALL 
SELECT employee_id, job_id
FROM job_history--10
ORDER BY 1;

--intersect
SELECT employee_id, job_id
FROM employees --107
INTERSECT 
SELECT employee_id, job_id
FROM job_history--10
ORDER BY 1;


SELECT name FROM villians
INTERSECT
SELECT name FROM favorites;


SELECT last_name AS "Name 1" FROM employees
UNION
SELECT department_name AS "Name 2" FROM departments

--EXCEPT

SELECT employee_id AS emp
FROM employees --107
EXCEPT 
SELECT employee_id
FROM job_history--10
ORDER BY emp;

SELECT employee_id
FROM  job_history
EXCEPT 
SELECT employee_id
FROM employees


----

SELECT name FROM villians
EXCEPT
SELECT name FROM favorites; --Scar



SELECT name FROM favorites
EXCEPT
SELECT name FROM villians ; --Bob





SELECT fav_id FROM favorites
EXCEPT
SELECT name FROM villians



SELECT employee_id FROM employees WHERE last_name LIKE '%i%'
UNION
SELECT department_id FROM employees WHERE salary > 15000
ORDER BY employee_id

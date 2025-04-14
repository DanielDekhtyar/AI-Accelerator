SELECT salary
FROM employees;

SELECT AVG(salary)
FROM employees;

SELECT COUNT(lasT_name)
FROM employees;

SELECT COUNT(manageR_id)
FROM employees;

SELECT COUNT(*)
FROM departments;


SELECT MIN(lasT_name)
FROM employees;

SELECT MAX(hire_date)
FROM employees;


SELECT STDDEV_POP(salary) , STDDEV(salary)
FROM employees;


SELECT COUNT (DISTINCT salary)
FROM employees;


SELECT commission_pct +1
FROM employees;


SELECT SUM(commission_pct)
FROM employees;

SELECT COUNT(*)
FROM employees
WHERE commission_pct IS NOT NULL 
AND last_name LIKE 'A%';


SELECT AVG(commission_pct), AVG(COALESCE (commission_pct ,0))
FROM employees;





SELECT ROUND(AVG(commission_pct),3), ROUND(AVG(COALESCE (commission_pct ,0)),3)
FROM employees;


SELECT AVG(salary)
FROM employees;


SELECT AVG(salary)
FROM employees
GROUP BY department_id;

SELECT department_id, ROUND(AVG(salary)) "Avg"
FROM employees
--WHERE  department_id IS NOT NULL
GROUP BY department_id;


SELECT * FROM employees WHERE department_id IS NULL;

SELECT AVG(salary),CASE coalesce (commission_pct,0)
				WHEN 0 THEN 0
				ELSE 1 END AS "comm?"
FROM employees
GROUP BY CASE coalesce (commission_pct,0)
				WHEN 0 THEN 0
				ELSE 1 END;

SELECT CASE coalesce (commission_pct,0)
				WHEN 0 THEN 0
				ELSE 1 END AS "comm?", commission_pct
FROM employees;


SELECT ROUND(AVG(salary)), department_id AS "Dept", job_id,COUNT (*)
FROM employees 
GROUP BY department_id, job_id
ORDER BY department_id;



SELECT ROUND(AVG(salary)), department_id AS "Dept"
FROM employees 
GROUP BY  department_id
ORDER BY "Dept";
/*
SELECT SUM (salary), department_id, manager_id
FROM employees
GROUP BY department_id;



SELECT SUM(salary), department_id
FROM employees;

*/

SELECT SUM (e.salary), d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
GROUP BY d.department_name


SELECT SUM (e.salary), d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
GROUP BY d.department_name;

SELECT AVG(salary),department_id
FROM employees
--WHERE AVG(salary)>7000
GROUP BY department_id
HAVING AVG(salary)>7000;



SELECT MIN(salary), MAX (salary), department_id
FROM employees
WHERE commission_pct IS NULL
GROUP BY department_id
HAVING avg(salary) >7000
ORDER BY 1;

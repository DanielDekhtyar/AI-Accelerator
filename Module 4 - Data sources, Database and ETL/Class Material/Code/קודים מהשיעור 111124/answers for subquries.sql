--1
SELECT employee_id, salary, last_name--, department_id
FROM employees
WHERE department_id =( SELECT department_id 
						FROM employees 
						WHERE last_name ='Zlotkey')
AND
last_name !='Zlotkey';

--2
SELECT employee_id, last_name, salary, job_id
FROM employees
WHERE  salary > (SELECT AVG(salary) FROM employees);

--3
SELECT employee_id, last_name, salary, job_id
FROM employees
WHERE department_id IN (SELECT DISTINCT department_id FROM employees WHERE LOWER(last_name) LIKE '%u%')
AND LOWER(last_name) NOT LIKE '%u%';


--4
SELECT last_name, department_id
FROM employees
WHERE department_id IN ( SELECT department_id FROM departments WHERE location_id =1700)

SELECT last_name, d.department_id
FROM employees e JOIN departments d USING (department_id)
WHERE location_id = 1700

--5

SELECT employee_id, last_name, salary, job_id
FROM employees
WHERE manager_id IN (SELECT employee_id FROM employees WHERE last_name = 'King'/* AND manager_id IS NULL*/)
;

--6
SELECT last_name
FROM employees
WHERE department_id =(SELECT department_id FROM departments WHERE department_name ='Executive');

--7
SELECT employee_id, last_name, salary, job_id
FROM employees
WHERE department_id IN (SELECT DISTINCT department_id FROM employees WHERE LOWER(last_name) LIKE '%u%')
AND LOWER(last_name) NOT LIKE '%u%'
AND  salary > (SELECT AVG(salary) FROM employees);


--8
SELECT employee_id, last_name, salary, job_id
FROM employees o
WHERE salary = (SELECT MAX(salary) FROM employees i WHERE o.job_id = i.job_id )



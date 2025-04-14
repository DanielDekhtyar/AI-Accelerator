--1
SELECT department_id
FROM departments
EXCEPT
SELECT department_id
FROM employees
WHERE job_id = 'ST_CLERK';

--2
SELECT last_name,salary
FROM employees
WHERE job_id LIKE 'ST%'
INTERSECT
SELECT last_name, salary
FROM employees
WHERE manager_id != 100;

--3
SELECT last_name,salary
FROM employees
WHERE job_id LIKE 'ST%'
INTERSECT
SELECT last_name, salary
FROM employees
WHERE manager_id =100


--4
SELECT country_id, country_name
FROM countries
EXCEPT
SELECT DISTINCT c.country_id, c.country_name
FROM 	countries c JOIN locations l USING (country_id)
		JOIN departments d USING (location_id);
--5
SELECT * FROM job_history;
SELECT job_id FROM employees where employee_id =176;
/*
(SELECT employee_id
FROM employees
EXCEPT
SELECT employee_id
FROM job_history) --עובדים שאין להם היסטוריה כלומר לא החליפו עבודה

UNION
	
(SELECT employee_id,job_id
FROM employees
INTERSECT
SELECT employee_id,job_id
FROM job_history) -- עובדים שהחליפו תפקיד וחזרו לאותו תפקיד אחר כך
*/--יש חוסר התאמה בעמודות

--one way but no job id
(SELECT employee_id, null
FROM employees
EXCEPT
SELECT employee_id,null
FROM job_history) --עובדים שאין להם היסטוריה כלומר לא החליפו עבודה

UNION
	
(SELECT employee_id,job_id
FROM employees
INTERSECT
SELECT employee_id,job_id
FROM job_history) -- עובדים שהחליפו תפקיד וחזרו לאותו תפקיד אחר כך
-- דרך נכונה מלאה שעובדת
SELECT employee_id, job_id
FROM employees
WHERE employee_id NOT IN (SELECT employee_id FROM job_history)--עובדים ללא היסטוריה
UNION
(SELECT employee_id,job_id
FROM employees
INTERSECT
SELECT employee_id,job_id
FROM job_history) -- עובדים שהחליפו תפקיד וחזרו לאותו תפקיד אחר כך


--6
SELECT last_name "employee", department_id "dept #", null "dept name"
FROM employees
UNION
SELECT null,department_id , department_name
FROM departments
ORDER BY 2
;

SELECT 'let''s take a break'





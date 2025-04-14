--1
SELECT c.country_name, r.region_name
FROM regions r, countries c
WHERE r.region_id = c.region_id;

--2
SELECT c.country_name, r.region_name
FROM regions r, countries c
WHERE r.region_id = c.region_id
ORDER BY 2, length(r.region_name) DESC;


--3
SELECT l.city, c.country_name
FROM countries c, locations l
WHERE c.country_id = l.country_id;



--4
SELECT l.city, r.region_name
FROM regions r, countries c, locations l
WHERE 	l.country_id = c.country_id
AND 	c.region_id = r.region_id;


--5
SELECT e.employee_id ,e.lasT_name, e.manager_id,m.lasT_name
FROM employees e, employees m
WHERE e.manager_id = m.employee_id;

--6

SELECT e.employee_id ,e.lasT_name, e.manager_id,m.lasT_name, m.job_id
FROM employees e, employees m
WHERE e.manager_id = m.employee_id
AND m.job_id LIKE 'AD%' ;

SELECT e.employee_id ,e.lasT_name, e.manager_id,m.lasT_name, m.job_id
FROM employees e, employees m
WHERE e.manager_id = m.employee_id
AND SUBSTR(m.job_id,1,2) ='AD';



--7
SELECT *
FROM jobs;

SELECT e.last_name, e.salary, e.job_id, j.min_salary, j.max_salary
FROM employees e, jobs j
WHERE e.job_id =j.job_id
AND (e.salary= j.min_salary OR e.salary = j.max_salary);
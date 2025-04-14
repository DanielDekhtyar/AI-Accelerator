--1
SELECT * FROM countries;
SELECT * FROM locations;

SELECT  l.street_address ||' '||l.city||' '|| c.country_name
FROM countries c JOIN locations l USING (country_id)
WHERE l.street_address LIKE '%9%';
 
--2
SELECT last_name||' '||first_name AS "Full name",department_name, salary, LENGTH(email)
FROM employees e JOIN departments d USING (department_id)
WHERE salary NOT BETWEEN 6000 AND 17000
AND LENGTH(email) IN (6,7);

--3
SELECT department_name, first_name, last_name
FROM departments d LEFT OUTER JOIN employees e
ON (d.manager_id = e.employee_id);

SELECT * FROM departments;

--4
--jobs -> employees -> departments
SELECT DISTINCT j.job_title, d.department_name
FROM jobs j JOIN employees e USING (job_id) JOIN departments d USING (department_id)

--5
SELECT 	e.first_name||' '||e.last_name as "employee name", e.salary "emp sal",
		m.first_name||' '||m.last_name as "mgr name", m.salary "mgr sal"
FROM  employees e JOIN employees m ON (e.manager_id= m.employee_id)
WHERE e.salary > m.salary;

--6
SELECT j.job_title, h.employee_id
FROM jobs j FULL OUTER JOIN job_history h ON (j.job_id = h.job_id);

--7
SELECT last_name, e.job_id as "curr job", h.job_id AS "prev job", e.department_id
FROM job_history h JOIN employees e USING (employee_id)
WHERE e.department_id = h.department_id--same dept
AND e.job_id != h.job_id ;--diff job

--8
SELECT * FROM jobs;
SELECT * FROM employees;
SELECT * FROM locations;

-- jobs-> emps -> dept -> loc ->countries -> regions
SELECT e.last_name, e.first_name,city, street_address, region_name
FROM 	employees e JOIN departments USING (department_id)
		JOIN locations USING (location_id)
		JOIN countries USING (country_id)
		JOIN regions USING (region_id)
		JOIN jobs j ON (j.job_id = e.job_id)
WHERE j.job_title ='Human Resources Representative';


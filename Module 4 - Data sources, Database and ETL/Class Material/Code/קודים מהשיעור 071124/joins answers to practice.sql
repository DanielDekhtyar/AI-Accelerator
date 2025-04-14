--1
SELECT location_ID, street_address, city, state_province,  country_name
FROM locations NATURAL JOIN countries ;

--2
SELECT last_name, department_name
FROM employees LEFT OUTER JOIN departments USING (department_id);

--3

SELECT *
FROM locations
WHERE LOWER(city) = 'toronto';

SELECT last_name, department_name, city
FROM employees e 
			JOIN departments d USING (department_id)
			JOIN locations l USING (location_id)
WHERE LOWER(city) = 'toronto';


SELECT last_name, department_name, city
FROM employees e 
			JOIN departments d ON (d.department_id=e.department_id)
			JOIN locations l ON (l.location_id = d.location_id)
WHERE LOWER(city) = 'toronto';


SELECT e.last_name, d.department_name, l.city
FROM employees e 
			JOIN departments d ON (d.department_id=e.department_id)
			JOIN locations l ON (l.location_id = d.location_id AND LOWER(city) = 'toronto');
--WHERE LOWER(city) = 'toronto';


--4
SELECT o.employee_id AS "#emp" , o.last_name AS "Emp Name", o.manager_id as "#mgr", m.last_name AS "mgr name"
FROM employees o  JOIN employees m ON (o.manageR_id = m.employee_id);

--5
SELECT o.employee_id AS "#emp" , o.last_name AS "Emp Name", o.manager_id as "#mgr", m.last_name AS "mgr name"
FROM employees o  LEFT OUTER JOIN employees m ON (o.manageR_id = m.employee_id);


--6

SELECT e.last_name as "name", c.last_name as "Col"
FROM employees e JOIN employees c ON (e.department_id =c.department_id)
WHERE  e.employee_id != c.employee_id;


--7
SELECT * FROM sal_grades;

SELECT e.last_name, e.salary,s.salary_grade, j.job_title
FROM employees e JOIN jobs j USING (job_id)
JOIN sal_grades s ON (e.salary BETWEEN low_sal AND high_sal);


--8
SELECT e.last_name, e.hire_date , d.hire_date
FROM employees e JOIN employees d ON (LOWER(d.last_name) = 'davies'AND e.hire_date> d.hire_date)
ORDER BY 2;


--9

SELECT e.lasT_name, e.hire_date, m.last_name "mgr" , m.hire_date as "mgr date"
FROM employees e JOIN employees m ON (e.manager_id = m.employee_id)
WHERE e.hire_date < m.hire_date;


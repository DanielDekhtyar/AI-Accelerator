/*
Join tables
7.11.2024
by Daniel Dekhtyar
*/

-- 1
SELECT loc.location_id, loc.street_address, loc.city, loc.state_province, country_id
FROM locations loc NATURAL JOIN countries c;

-- 2
SELECT emp.last_name AS "Last name", emp.department_id AS "Department ID", deps.department_name AS "Department Name"
FROM employees emp, departments deps WHERE emp.department_id = deps.department_id;

-- 3
SELECT e.last_name, e.job_id, e.department_id, d.department_name
FROM employees e JOIN departments d USING (department_id)
JOIN locations l ON (e.department_id = d.department_id AND LOWER(l.city) = 'toronto');

-- 4
SELECT e.last_name AS "Employee Last Name", e.employee_id AS "Emp#", m.last_name AS "Manager Last Name", m.employee_id AS "Mgr#"
FROM employees e JOIN employees m ON (e.manager_id = m.employee_id);














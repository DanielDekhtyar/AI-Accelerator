/*
Group functions morning warmup
14.11.2024
Daniel Dekhtyar
*/

-- 1
SELECT d.department_name AS "Department Name", ROUND(AVG(e.salary)) AS "Avarage Salary"
FROM employees e, departments d
WHERE d.department_id = e.department_id
GROUP BY d.department_id;

-- 2
SELECT l.city, COUNT(d.department_id)
FROM locations l, departments d
WHERE l.location_id = d.location_id
GROUP BY city;

-- 3
SELECT c.country_name, COUNT(d.department_id)
FROM locations l JOIN departments d USING (location_id) JOIN countries c USING (country_id)
GROUP BY country_name;

-- 4
SELECT l.city, COUNT(d.department_id) AS "Number of departments", ROUND(AVG(salary)) AS "Avarage Salary"
FROM locations l JOIN departments d USING (location_id) JOIN employees e USING (department_id)
GROUP BY l.city
HAVING COUNT(employee_id) > 1 AND AVG(salary) > 8000;
--1
SELECT AVG(salary),department_name, count(*)
FROM employees JOIN departments USING (department_id)
GROUP BY department_name;

---2
SELECT COUNT(d.department_id),l.city
FROM departments d JOIN locations l USING (location_id)
GROUP BY l.city;

--3
SELECT * FROM departments d JOIN locations l USING (location_id);
	
SELECT COUNT(d.department_id),c.country_name
FROM departments d JOIN locations l USING (location_id)JOIN countries c USING (country_id)
GROUP BY c.country_name;

--4
SELECT COUNT(employee_id),count(*), l.city, ROUND(AVG (salary))
FROM departments d JOIN locations l USING (location_id) JOIN employees USING(department_id)
GROUP BY l.city
HAVING count(employee_id) >1
		AND AVG (salary) >8000;


--5

SELECT ROUND(AVG (salary))--,region_name 
FROM employees JOIN departments d USING(department_id)
				JOIN locations l USING (location_id) 
				JOIN  countries USING (country_id)
				JOIN regions USING (region_id)
WHERE region_name = 'Europe'
--GROUP BY region_name;

--6
SELECT d.department_name, COUNT (DISTINCT job_id)
FROM departments d JOIN employees e USING (department_id)
GROUP BY d.department_name;

--7
SELECT department_id, VAR_POP(salary), COUNT(*)
FROM employees
GROUP BY department_id
ORDER BY 2 DESC;


--8
SELECT department_name, VAR_POP(salary)
FROM departments JOIN employees USING(department_id)
GROUP BY department_name
HAVING VAR_POP(salary) = (
							SELECT MAX(vps)
							FROM(
									SELECT  VAR_POP(salary) AS vps
									FROM employees
									GROUP BY department_id)
							)
--Lidor BETTER way
SELECT department_name, VAR_POP(salary)
FROM departments JOIN employees USING(department_id)
GROUP BY department_name
HAVING VAR_POP(salary)  >= ALL (
								SELECT  VAR_POP(salary) AS vps
									FROM employees
									GROUP BY department_id)

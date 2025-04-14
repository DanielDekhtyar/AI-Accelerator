SELECT employee_id, last_name, department_id
FROM employees;

SELECT * FROM departments;

SELECT last_name, department_name
FROM employees, departments; --crtesian product

SELECT last_name, department_name
FROM employees, departments
WHERE employees.department_id = departments.department_id;


SELECT last_name, department_name, employees.department_id
FROM employees, departments
WHERE employees.department_id = departments.department_id;


SELECT e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;

-- non equi joins
SELECT * FROM sal_grades;

SELECT employee_id, last_name, salary , salary_grade
FROM employees , sal_grades
WHERE salary BETWEEN low_sal AND high_sal;


SELECT e.employee_id, e.last_name, e.salary , s.salary_grade
FROM employees e , sal_grades s
WHERE e.salary BETWEEN s.low_sal AND s.high_sal;


SELECT e.employee_id, e.last_name, e.salary , s.salary_grade
FROM employees e , sal_grades s
WHERE e.salary BETWEEN s.low_sal AND s.high_sal
	AND lower(last_name) LIKE '%a%';

--more then 2

SELECT * FROM departments;

SELECT * FROM locations;


SELECT e.last_name||' '||e.first_name AS "name", d.department_name as "Dept", l.city
FROM employees e, departments d,locations l
WHERE e.department_id =d.department_id 
AND d.location_id = l.location_id;


SELECT e.last_name||' '||e.first_name AS "name", d.department_name as "Dept", l.city
FROM employees e, departments d,locations l
WHERE e.department_id =d.department_id 
AND d.location_id = l.location_id
AND first_name = 'Shelley';

SELECT employee_id, last_name, manager_id
FROM employees;



SELECT e.employee_id "emp id",e.manager_id as "#mgr", e.last_name as "employee", m.last_name AS "mgr"
FROM employees e, employees m
WHERE e.manager_id = m.employee_id;



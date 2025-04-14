SELECT e.last_name "emp name", j.job_title "emp job", m.last_name "mgr name"
FROM employees e, jobs j, employees m
WHERE e.job_id = j.job_id
AND e.manageR_id = m.employee_id 
order by 3;
/*
SELECT employee_id, last_name, department_name
FROM employees e, departments d;

SELECT employee_id, last_name, department_name
FROM employees e  
CROSS JOIN departments d;
*/


SELECT last_name, department_name
FROM employees NATURAL JOIN departments;

SELECT last_name, department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;

SELECT last_name, job_title
FROM employees e NATURAL JOIN  jobs;


SELECT last_name, department_name
FROM employees  
JOIN departments
USING (department_id);

SELECT e.employeE_id, e.last_name, e.salary, s.salary_grade
FROM employees e JOIN sal_grades s
ON (e.salary BETWEEN s.low_sal AND s.high_sal)
WHERE department_id IN (100,30,50);

--outer_join
SELECT employee_id FROM employees WHERE  department_id IS NULL;


-- with emps thet don't have a dept	
SELECT employee_id, last_name, department_name
FROM employees e LEFT OUTER JOIN departments d
ON ( e.department_id = d.department_id);


--depts with no emps in it
SELECT employee_id, last_name, department_name
FROM employees e RIGHT OUTER JOIN departments d
ON ( e.department_id = d.department_id);



--both
SELECT employee_id, last_name, department_name
FROM employees e FULL OUTER JOIN departments d
ON ( e.department_id = d.department_id)

--just nulls
SELECT employee_id, last_name, department_name
FROM employees e FULL OUTER JOIN departments d
ON ( e.department_id = d.department_id)
WHERE department_name IS NULL 
OR employee_id IS NULL;
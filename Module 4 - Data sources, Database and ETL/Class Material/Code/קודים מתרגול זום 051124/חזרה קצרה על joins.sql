--equi join
SELECT * FROM job_history;

SELECT last_name, start_date, end_date, e.job_id as "current job", j.job_id as "prev job"
FROM employees e, job_history j
WHERE e.employee_id = j.employee_id;

SELECT * FROM sal_grades;

SELECT e.lasT_name, /*s.low_sal, e.salary, s.high_sal,*/ s.salary_grade
FROM employees e, sal_grades s
WHERE e.salary BETWEEN s.low_sal AND s.high_sal;

SELECT e.employee_id ,e.lasT_name, e.manager_id,department_id --m.lasT_name
FROM employees e--, employees m
--WHERE e.manager_id = m.employee_id;



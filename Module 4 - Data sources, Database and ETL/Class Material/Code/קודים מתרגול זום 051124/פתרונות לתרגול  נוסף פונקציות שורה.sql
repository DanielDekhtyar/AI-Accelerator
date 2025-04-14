--1
SELECT 	employee_id, last_name,job_id,
		LOWER(SUBSTR(first_name,1,5)||'.'||SUBSTR(last_name,1,2)||'@technion.ac.il') aS "email"
FROM employees
WHERE job_id LIKE 'S%'
ORDER BY salary;
--2
SELECT employee_id, last_name||' '||first_name as "full name", hire_date,
		EXTRACT (year from hire_date) as "year",
		EXTRACT (month from hire_date) as "mm",
		EXTRACT (day from hire_date) as "dd"
FROM employees
WHERE department_id IN (30,100);

--3

SELECT employee_id, last_name||' '||first_name as "full name", hire_date,
		ROUND(EXTRACT( day from CURRENT_TIMESTAMP -hire_date)/365,0) as "how long"
FROM employees
WHERE department_id IN (30,100);

--4

SELECT last_name, job_id, 
	CASE EXTRACT(dow from hire_date)
		WHEN 0 THEN 'Shvizoot'
		WHEN 1 THEN 'monday'
		WHEN 2 THEN 'zoom'
		WHEN 3 THEN 'just a day'
		WHEN 4 THEN  'class'
		ELSE 'weekend' END AS "dow"
	
FROM employees
--WHERE last_name ='Kaufling'
	;

--5
SELECT employeE_id, last_name, TRIM('.0' from CAST(salary AS varchar))
FROM employees;


SELeCT employeE_id, last_name,salary, TRIM('0' from CAST(ROUND(salary,0) AS varchar))
FROM employees
WHERE last_name = 'King';


--6
SELECT city, street_address, state_province, postal_code,
	COALESCE (state_province,postal_code, 'un known') as "what ever"
FROM locations;


SELECT employee_id, last_name, commission_pct, COALESCE (commission_pct, salary)
FROM EMPLOYEES;

--7
SELECT employee_id, extract(year from start_date)"start",extract (year from end_date)"end",
			NULLIF(extract(year from start_date),extract (year from end_date)) as "null if"
FROM job_history;

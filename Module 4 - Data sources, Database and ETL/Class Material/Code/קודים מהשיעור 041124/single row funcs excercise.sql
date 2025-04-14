--1
SELECT NOW();
SELECT CURRENT_TIMESTAMP;
SELECT CAST(NOW() as DATE);
SELECT CAST(NOW() as DATE) 
FROM employees WHERE employee_id =100;

--2
SELECT employee_id, last_name, ROUND(salary*1.15 ) AS "full sal"
FROM employees;

--3
SELECT employee_id, last_name, ROUND(salary*1.15 ) AS "full sal", ROUND(salary*1.15 )-salary AS "Inc"
FROM employees;

--4
/*
SELECT last_name, LOWER(last_name) , LENGTH(last_name)
FROM employees
WHERE SUBSTR(UPPER(CONCAT(last_name,' ',first_name),1,1)) IN ('J' , 'M', 'A');
*/ --errors with the()

SELECT last_name, LOWER(last_name) , LENGTH(last_name)
FROM employees
WHERE SUBSTR(UPPER(CONCAT(last_name,' ',first_name)),1,1) IN ('J' , 'M', 'A');

--5
SELECT employee_id, job_id, last_name
FROM employees
WHERE LOWER(last_name) LIKE '%a%';



--6
SELECT employee_id, job_id, last_name,
		SUBSTR(last_name,  
				STRPOS(LOWER(last_name),'a'),
				LENGTH(SUBSTR(last_name,  STRPOS(LOWER(last_name),'a')))-1)AS "ahhhhaha"
	
FROM employees
WHERE LOWER(last_name) LIKE '%a%';

--7
SELECT employee_id, job_id, last_name,
		COALESCE(salary*(1+commission_pct),salary) "Full Sal"
FROM employees
WHERE LOWER(last_name) LIKE '%a%';



--8

SELECT last_name||' '||first_name AS "Name", job_id,
		CASE  WHEN job_id LIKE '%MAN%' THEN 'Boss' ELSE 'emp'END AS "job"
FROM employees

--9


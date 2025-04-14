SELECT 'my emp is ' ||first_name||' is a '||job_id AS "emps", salary*12 as "annual salary"
FROM employees
WHERE salary*12 BETWEEN 125000 AND 150000
ORDER BY department_id DESC, first_name ASC;


select *
FROM employees
WHERE first_name = 'Shelley';


SELECT * FROM departments WHERE department_id =110;

SELECT * FROM locations WHERE location_id =1700;

select last_name, last_name ||'i just want to add some test blah blah blah',
		salary, salary*12
FROM employees;


--single row functions

--case functions

SELECT 	last_name, LOWER(last_name) AS "lower", UPPER (last_name) AS "upper",
		job_id, INITCAP (job_id) as "initcap"
FROM employees
WHERE department_id in (50,40);


SELECT last_name,employee_id
FROM employees
WHERE LOWER(last_name) LIKE '%a%';

SELECT CONCAT(last_name,' tralalalala ', first_name) 
FROM employees;

SELECT employee_id, last_name, strpos(LOWER(last_name),'a')
FROM employees
WHERE UPPER (last_name) LIKE '%A%';


SELECT employee_id, last_name, CONCAT(strpos(LOWER(last_name),'a'),' is the a pos')
FROM employees
WHERE UPPER (last_name) LIKE '%A%';


SELECT employee_id, last_name, strpos(LOWER(last_name),'a')
FROM employees
WHERE STRPOS(last_name,'a') =4;


SELECT employee_id, last_name--, strpos(LOWER(last_name),'a')
FROM employees
WHERE UPPER (last_name) LIKE '%A%'
ORDER BY strpos(LOWER(last_name),'a');



SELECT SUBSTR('How you doin?',1,5);

SELECT SUBSTR('How you doin?',4);


SELECt employee_id, last_name, SUBSTR (last_name,2,4)
FROM employees;

SELECt employee_id, last_name, 
			SUBSTR (last_name,
								STRPOS(LOWER(last_name),'a'))
FROM employees;



SELECT job_id , SUBSTR(job_id, 1,3) AS "1,3", SUBSTR(job_id,2,3)AS "2,3"
FROM employees;

SELECT last_name, SUBSTR(last_name,5,2) "5,2"
FROM employees;

SELECT last_name, LENGTH (last_name)
FROM employees;

SELECT last_name
FROM employees
ORDER BY  LENGTH (last_name);


SELECT last_name, SUBSTR (last_name,3,4) "SUBSTR", LENGTH (SUBSTR (last_name,3,4))"len"
FROM employees;

SELECT employee_id, salary, commission_pct, last_name
FROM employees
WHERE LENGTH(last_name) BETWEEN 4 AND 6;




SELECT LENGTH(TRIM (' Hello     '));

SELECT last_name, TRIM ('K' from last_name)
FROM employees;


SELECT last_name, INITCAP(TRIM ('n' from LOWER(last_name))) as "trim n"
FROM employees
WHERE LOWER(last_name) LIKE '%n%';

SELECT TRIM ('a' FROM 'aaaaaalilulaliaaaaaaaaaa');

SELECT TRIM (LEADING 'a' FROM 'aaaaaalilulaliaaaaaaaaaa');
SELECT TRIM (TRAILING 'a' FROM 'aaaaaalilulaliaaaaaaaaaa');
SELECT TRIM ('SQL' FROM'I LOVE tralalaSQL');

SELECT TRIM ('SQL' FROM'I LOVE tralalaSQL!!');


--dates

select employee_id, last_name, first_name, hire_date
from employees;



SELECT CURRENT_TIMESTAMP, NOW();

select employee_id, last_name, first_name, hire_date, (now()-hire_date)/365 as "pazam"
from employees;

SELECT last_name, hire_date, EXTRACT(year from hire_date)
FROM employees;

SELECT last_name, hire_date, EXTRACT(dow from hire_date)
FROM employees
WHERE EXTRACT(year from hire_date) =1994;


SELECT last_name, CAST (last_name as char(6))
FROM employees;


--numbers
SELECT MOD (15,4);

SELECT salary, mod(salary,17) "mod"
FROM employees;

SELECT ROUND(45.923,2), ROUND(45.923,0),ROUND(45.923,-1),ROUND(45.923,-2);
SELECT TRUNC(45.923,2), TRUNC(45.923,0),TRUNC(45.923,-1),TRUNC(45.923,-2),
		ROUND(45.923,2), ROUND(45.923,0),ROUND(45.923,-1),ROUND(45.923,-2);



SELECT ROUND(45.923);


SELECT employee_id, last_name, commission_pct,department_id
FROM employees
WHERE commission_pct IS  NULL;


SELECT employee_id, last_name, commission_pct, salary*(1+commission_pct)
FROM employees;

SELECT employee_id, last_name, commission_pct, COALESCE (commission_pct, 0)
FROM employees;


SELECT employee_id, last_name, commission_pct,COALESCE (commission_pct, 0) as "coalesce",
		salary*(COALESCE (commission_pct, 0)+1) as "full sal"
FROM employees;

SELECT employee_id, last_name, commission_pct, COALESCE(salary*(1+commission_pct), salary) AS "Full sal"
FROM employees;

select first_name, coalesce(commission_pct, department_id) as "stam"
from employees;

SELECT last_name , LENGTH (last_name), first_name, LENGTH (first_name), 
		NULLIF ( LENGTH (last_name),LENGTH (first_name))

FROM employees;

--case
SELECT last_name, job_id, salary,
       CASE job_id WHEN 'IT_PROG'  THEN  1.10*salary
                   WHEN 'ST_CLERK' THEN  1.15*salary
                   WHEN 'SA_REP'   THEN  1.20*salary
       ELSE      salary END     "REVISED_SALARY"
FROM   employees;

SELECT last_name, job_id, salary,
       CASE  		WHEN job_id LIKE '%IT%'  THEN  'nerd'
                   	WHEN job_id LIKE '%HR%' THEN 'devil'
                   	WHEN job_id LIKE '%SA%'  THEN  'anoying'
       ELSE      'boring' END     "REVISED_SALARY"
FROM   employees;







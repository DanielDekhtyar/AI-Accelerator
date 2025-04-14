--SUB QUERIES
SELECT salary
FROM employees 
WHERE first_name = 'Shelley';

SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary > 12000;


SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary = (SELECT salary
					FROM employees 
					WHERE first_name = 'Shelley');



SELECT employee_id, first_name, last_name, salary,job_id
FROM employees
WHERE 	job_id = (SELECT job_id FROM employees WHERE employee_id = 141)
		AND 
		salary > (SELECT salary FROM employees WHERE employee_id =143);




SELECT employee_id, first_name, last_name, salary,job_id
FROM employees
WHERE 	job_id = (SELECT job_id FROM employees WHERE employee_id = 141)
		AND 
		salary > (SELECT salary FROM employees WHERE employee_id =143)
		AND
		employee_id <>141;



SELECT *
FROM employees
WHERE department_id  = (SELECT department_id 
						FROM departments 
						WHERE department_name ='IT');

/*
SELECT last_name, salary
FROM employees
HAVING salary > MIN(salary);


SELECT salary
FROM employees
HAVING salary > MIN(salary);

SELECT last_name, salary
FROM employees
WHERE salary > MIN(salary);
*/

SELECT last_name, salary
FROM employees
WHERE salary > (SELECT MIN(salary) FROM employees);



--SUB QUERY IN THE HAVING
SELECT MIN(salary)
FROM employees
WHERE department_id =50;


SELECT department_id
FROM employees
GROUP by department_id
HAVING MIN(salary) >2100;




SELECT department_id
FROM employees
GROUP by department_id
HAVING MIN(salary) >(	SELECT MIN(salary)
						FROM employees
						WHERE department_id =50);


SELECT employee_id, last_name||' '||first_name AS "full name", salary
FROM employees
WHERE salary IN (SELECT salary FROM employees WHERE first_name = 'Karen');
/*
SELECT employee_id, last_name||' '||first_name AS "full name", salary
FROM employees
WHERE salary IN( (),(),())
*/


SELECT employee_id, last_name||' '||first_name AS "full name", salary
FROM employees
WHERE salary > (SELECT MAX(salary) FROM employees WHERE first_name = 'Karen');


SELECT employee_id, last_name||' '||first_name AS "full name", salary
FROM employees
WHERE salary > ALL (SELECT salary FROM employees WHERE first_name = 'Karen');


SELECT employee_id, last_name||' '||first_name AS "full name", salary
FROM employees
WHERE salary >ANY (SELECT salary FROM employees WHERE first_name = 'Karen');


--who are not managers
SELECT last_name
FROM   employees
WHERE  employee_id NOT IN
                             (SELECT manager_id
                              FROM   employees
								WHERE manager_id IS NOT NULL);



SELECT last_name
FROM   employees
WHERE  employee_id NOT IN (100,102,null);

---who makes more then the avg for their job

SELECT employee_id,last_name, salary, job_id
FROM employees o
WHERE salary > (	SELECT AVG(salary) 
					FROM employees 
					WHERE o.job_id =job_id);


SELECT AVG(salary) 
FROM employees 
WHERE job_id = 'IT_PROG';


SELECT employee_id,last_name, salary, a.job_id, avg_sal
FROM employees o
JOIN (SELECT AVG(salary) "avg_sal" ,job_id FROM employees GROUP BY job_id ) a
ON a.job_id = o.job_id
WHERE salary > (	SELECT AVG(salary) 
					FROM employees 
					WHERE o.job_id =job_id);
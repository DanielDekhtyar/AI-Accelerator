/*
Group Functions
11.11.2024
Daniel Dekhtyar
*/

-- Morning exercise
-- 1
SELECT COUNT(commission_pct)
FROM employees
WHERE commission_pct IS NOT NULL;

-- 2
SELECT department_id, COUNT(commission_pct)
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY department_id;
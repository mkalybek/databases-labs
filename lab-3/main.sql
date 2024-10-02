CREATE DATABASE lab3;

SELECT lastname FROM employees;

SELECT distinct lastname FROM employees;

SELECT * FROM employees WHERE lastname = 'Smith';

SELECT * FROM employees WHERE lastname IN ('Smith', 'Doe');

SELECT * FROM employees WHERE department = 14;

SELECT * FROM employees WHERE department IN (37, 77);

SELECT SUM(budget) FROM departments;

SELECT 
    d.code, COUNT(e) 
FROM departments d
    LEFT JOIN employees e
        ON e.department = d.code
GROUP BY d.code;

SELECT
    d.code
FROM departments d
    LEFT JOIN employees e
        ON e.department = d.code
GROUP BY d.code
HAVING COUNT(e) > 2;

SELECT
    d.name
FROM departments d
ORDER BY budget DESC
OFFSET 1
LIMIT 1;

SELECT
    e.name
FROM employees e
WHERE e.department IN (
    SELECT d.code
        FROM departments d
    ORDER BY budget ASC
    LIMIT 1
);

SELECT name FROM employees WHERE city = 'Almaty';

SELECT * FROM departments
    WHERE budget > 60000
ORDER BY budget asc, code desc;

UPDATE departments 
    SET budget = budget * 0.9 
WHERE code in (
    SELECT d.code
        FROM departments d
    ORDER BY budget ASC
    LIMIT 1
);

UPDATE
    employees
SET department = (SELECT code FROM departments WHERE name = 'Research')
WHERE department = (SELECT code FROM departments WHERE name = 'IT');

DELETE FROM employees WHERE department = (SELECT code FROM departments where  NAME = 'IT');

DELETE FROM employees;
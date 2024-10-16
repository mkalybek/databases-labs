-- 2 task
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    cust_name VARCHAR(255),
    city VARCHAR(255),
    grade INT,
    salesman_id INT
);

CREATE TABLE orders (
    ord_no SERIAL PRIMARY KEY,
    purch_amt DECIMAL(10, 2),
    ord_date DATE,
    customer_id INT REFERENCES customers(customer_id),
    salesman_id INT
);

-- 3 task
SELECT SUM(purch_amt) FROM orders;

-- 4 task
SELECT AVG(purch_amt) FROM orders;

-- 5 task
SELECT COUNT(*) FROM customers WHERE cust_name IS NOT NULL;

-- 6 task
SELECT MIN(purch_amt)
FROM orders;

-- 7 task
SELECT * FROM customers
WHERE cust_name ILIKE '%b';

-- 8 task
SELECT o.* FROM orders o
    LEFT JOIN customers c 
        ON o.customer_id = c.customer_id
WHERE c.city = 'New York';

-- 9 task
SELECT DISTINCT c.* FROM customers c
    LEFT JOIN orders o 
        ON c.customer_id = o.customer_id
WHERE o.purch_amt > 10;

-- 10 task
SELECT SUM(grade) FROM customers;

-- 11 task
SELECT * FROM customers WHERE cust_name IS NOT NULL;

-- 12 task
SELECT MAX(grade) FROM customers;
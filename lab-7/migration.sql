CREATE TABLE countries (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    surname VARCHAR(255),
    salary NUMERIC,
    department_id INT
);

CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    budget NUMERIC
);
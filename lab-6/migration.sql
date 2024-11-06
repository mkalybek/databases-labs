CREATE DATABASE "lab6";

CREATE TABLE locations (
  location_id SERIAL PRIMARY KEY,
  street_address VARCHAR(25), 
  postal_code VARCHAR(12), 
  city VARCHAR(30), 
  state_province VARCHAR(12)
);

CREATE TABLE departments(
  department_id SERIAL PRIMARY KEY,
  department_name VARCHAR(50) UNIQUE,
  budget INTEGER, 
  location_id INTEGER REFERENCES locations
);

CREATE TABLE employees (
  employee_id SERIAL PRIMARY KEY, 
  first_name VARCHAR(50), 
  last_name VARCHAR(50), 
  email VARCHAR(50), 
  phone_number VARCHAR(20), 
  salary INTEGER, 
  department_id INTEGER REFERENCES departments
);

CREATE DATABASE lab2;


START TRANSACTION;
CREATE TABLE countries (
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(255),
    region_id INT,
    population INT
);

INSERT INTO countries (country_name, region_id, population)
VALUES ('Kazakhstan', 1, 19000000);

INSERT INTO countries (country_name, region_id)
VALUES ('Russia', 1);

INSERT INTO countries (country_name, region_id, population)
VALUES ('USA', NULL, 331000000);

INSERT INTO countries (country_name, region_id, population)
VALUES 
('China', 2, 1400000000),
('India', 3, 1390000000),
('Brazil', 4, 213000000);

ALTER TABLE countries ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';

INSERT INTO countries (region_id, population)
VALUES (5, 50000000);

INSERT INTO countries default values;

CREATE TABLE countries_new (LIKE countries INCLUDING ALL);

INSERT INTO countries_new SELECT * FROM countries;

UPDATE countries
SET region_id = 1
WHERE region_id IS NULL;

SELECT country_name, population * 1.10 AS "New Population"
FROM countries;

DELETE FROM countries
WHERE population < 100000;

DELETE FROM countries_new
WHERE country_id IN (SELECT country_id FROM countries)
RETURNING *;

DELETE FROM countries
RETURNING *;

COMMIT TRANSACTION;
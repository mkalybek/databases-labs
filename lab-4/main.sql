-- 2 task
CREATE TABLE warehouses (
    code SERIAL,
    location character varying(255),
    capacity int
);

CREATE TABLE boxes (
    code character(4),
    contents character varying(255),
    value real,
    warehouse int
);

-- 3 task
INSERT INTO warehouses (location, capacity) VALUES
    ('Chicago', 3),
    ('Chicago', 4),
    ('New York', 7),
    ('Los Angeles', 2),
    ('San Francisco', 8);

INSERT INTO boxes (code, contents, value, warehouse) VALUES
    ('0MN7', 'Rocks', 180, 3),
    ('4H8P', 'Rocks', 250, 1),
    ('4RT3', 'Scissors', 190, 4),
    ('7G3H', 'Rocks', 200, 1),
    ('8JN6', 'Papers', 50, 3),
    ('9J6F', 'Papers', 175, 2),
    ('LL08', 'Rocks', 140, 4),
    ('P0H6', 'Scissors', 125, 1),
    ('P2T6', 'Scissors', 150, 2),
    ('TU55', 'Papers', 90, 5);

-- 4 task
SELECT * FROM warehouses;

-- 5 task
SELECT * FROM boxes WHERE value > 150;

-- 6 task
SELECT DISTINCT contents, * FROM boxes;

-- 7 task
SELECT warehouse, COUNT(boxes) FROM boxes
    GROUP BY warehouse;

-- 8 task
SELECT warehouse, COUNT(boxes) FROM boxes
    GROUP BY warehouse
    HAVING COUNT(boxes) > 2;

-- 9 task
INSERT INTO warehouses (location, capacity)
    VALUES ('New York', 3);

-- 10 task
INSERT INTO boxes (code, contents, value, warehouse) VALUES
    ('H5RT', 'Papers', 200, 2);

-- 11 task
UPDATE boxes SET value = value * 0.85 WHERE code = (
    SELECT code FROM boxes
		ORDER BY value DESC
        LIMIT 1 OFFSET 2 
);

-- 12 task
DELETE FROM boxes WHERE value < 150;

-- 13 task
DELETE FROM boxes WHERE warehouse IN (
    SELECT code FROM warehouses 
    WHERE location = 'New York'
) RETURNING *; 

-- 1
SELECT 
  e.first_name, 
  e.last_name, 
  e.department_id, 
  d.department_name
FROM 
  employees e
JOIN departments d ON e.department_id = d.department_id;

-- 2
SELECT 
  e.first_name, 
  e.last_name, 
  e.department_id, 
  d.department_name
FROM 
  employees e
JOIN  departments d ON e.department_id = d.department_id
WHERE
  e.department_id IN (80, 40);

-- 3
SELECT 
  e.first_name, 
  e.last_name, 
  d.department_name, 
  l.city, 
  l.state_province
FROM 
  employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id;

-- 4
SELECT 
  d.department_id, 
  d.department_name, 
  e.employee_id, 
  e.first_name, 
  e.last_name
FROM 
  departments d
LEFT JOIN employees e ON d.department_id = e.department_id;

-- 5
SELECT 
  e.first_name, 
  e.last_name, 
  e.department_id, 
  d.department_name
FROM 
  employees e
LEFT JOIN departments d ON e.department_id = d.department_id;

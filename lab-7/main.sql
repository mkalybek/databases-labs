-- Task 1
CREATE INDEX idx_countries_name ON countries(name);

-- Task 2
CREATE INDEX idx_employees_name_surname ON employees(name, surname);

-- Task 3
CREATE UNIQUE INDEX unique_idx_employees_salary ON employees(salary);

-- Task 4
CREATE INDEX idx_employees_substring_name ON employees(
    (
        substring(name FROM 1 FOR 4)
    )
);

-- Task 5
CREATE INDEX idx_employees_dep_salary ON employees(department_id, salary);
CREATE INDEX idx_departments_budget ON departments(budget);

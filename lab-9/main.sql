CREATE DATABASE lab9;

-- Task 1
CREATE OR REPLACE FUNCTION increase_value(val INTEGER)
RETURNS INTEGER AS $$
BEGIN
    RETURN val + 10;
END;
$$ LANGUAGE plpgsql;

-- Task 2
CREATE OR REPLACE FUNCTION compare_numbers(num1 INTEGER, num2 INTEGER)
RETURNS TEXT AS $$
BEGIN
    IF num1 > num2 THEN
        RETURN 'Greater';
    ELSIF num1 = num2 THEN
        RETURN 'Equal';
    ELSE
        RETURN 'Lesser';
    END IF;
END;
$$ LANGUAGE plpgsql;

-- Task 3
CREATE OR REPLACE FUNCTION number_series(n INTEGER)
RETURNS TABLE(series INTEGER) AS $$
BEGIN
    RETURN QUERY SELECT generate_series(1, n);
END;
$$ LANGUAGE plpgsql;

-- Task 4
CREATE OR REPLACE FUNCTION find_employee(emp_name TEXT)
RETURNS TABLE(employee_id INTEGER, name TEXT, position TEXT, salary NUMERIC) AS $$
BEGIN
    RETURN QUERY SELECT id, name, position, salary 
                 FROM employees
                 WHERE name = emp_name;
END;
$$ LANGUAGE plpgsql;

-- Task 5
CREATE OR REPLACE FUNCTION list_products(category_name TEXT)
RETURNS TABLE(product_id INTEGER, product_name TEXT, price NUMERIC) AS $$
BEGIN
    RETURN QUERY SELECT id, name, price 
                 FROM products
                 WHERE category = category_name;
END;
$$ LANGUAGE plpgsql;

-- Task 6
CREATE OR REPLACE FUNCTION calculate_bonus(employee_id INTEGER)
RETURNS NUMERIC AS $$
DECLARE
    bonus NUMERIC;
BEGIN
    SELECT salary * 0.1 INTO bonus
    FROM employees
    WHERE id = employee_id;
    RETURN bonus;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_salary(employee_id INTEGER)
RETURNS VOID AS $$
DECLARE
    bonus NUMERIC;
BEGIN
    bonus := calculate_bonus(employee_id);
    UPDATE employees
    SET salary = salary + bonus
    WHERE id = employee_id;
END;
$$ LANGUAGE plpgsql;

-- Task 7
CREATE OR REPLACE FUNCTION complex_calculation(num INTEGER, str VARCHAR)
RETURNS TEXT AS $$
DECLARE
    subblock1_result NUMERIC;
    subblock2_result VARCHAR;
BEGIN
    BEGIN
        subblock1_result := num * 2;
    END;

    BEGIN
        subblock2_result := CONCAT(str, ' processed');
    END;

    RETURN CONCAT('Result: ', subblock1_result, ', ', subblock2_result);
END;
$$ LANGUAGE plpgsql;


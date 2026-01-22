-- Exercises – additional commands

--1. Customer name and only the month of birth. If birth date is not filled, show "Not informed".
SELECT 
    full_name,
    COALESCE(TO_CHAR(birth_date, 'MM'), 'Not informed') AS "Birth month"
FROM customer;

--2. Customer name and only the month name of birth (January, February, etc). If birth date is not filled, show "Not informed".
SELECT 
    full_name,
    COALESCE(TO_CHAR(birth_date, 'Month'), 'Not informed') AS "Birth month"
FROM customer;

--3. Customer name and only the year of birth. If birth date is not filled, show "Not informed".
SELECT
    full_name,
    COALESCE(EXTRACT(YEAR FROM birth_date)::TEXT, 'Not informed') AS "Birth year"
FROM customer;

--4. Characters 5 to 10 of all cities.
SELECT
    SUBSTRING(name FROM 5 FOR 6) AS "Characters 5 to 10"
FROM city;

--5. Names of all cities in uppercase letters.
SELECT
    UPPER(name) AS "City"
FROM city;

--6. Customer name and gender. If M show "Male", otherwise show "Female".
SELECT
    full_name,
    CASE gender
        WHEN 'F' THEN 'Female'
        ELSE 'Male'
    END AS "Gender"
FROM customer;

--7. Product name and price. If price is greater than R$ 500.00 show message "Above 500", otherwise show message "Below 500".
SELECT
    name,
    price,
    CASE
        WHEN price > 500 THEN 'Above 500'
        WHEN price = 500 THEN 'Equal to 500'
        ELSE 'Below 500'
    END AS "Price category"
FROM product;
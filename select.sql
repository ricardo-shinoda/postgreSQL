SELECT * FROM customer;

-- Renaming a column
SELECT full_name, birth_date AS "Birth date" FROM customer;

-- Concatenating two fields
SELECT 'CPF: ' || cpf || ' RG: ' || rg AS "CPF and RG" FROM customer;

-- Limiting the quantity shown - only the first 5
SELECT * FROM customer LIMIT 5;

-- Bring customers born after a certain date
SELECT * FROM customer WHERE birth_date > '2001-01-01';

-- Customers whose name starts with C
SELECT * FROM customer WHERE full_name LIKE 'C%';

-- Customers containing the letter C in the middle
SELECT * FROM customer WHERE full_name LIKE '%c%';

-- Bringing customers in alphabetical order
SELECT * FROM customer ORDER BY full_name;

-- Bringing customers in descending alphabetical order
SELECT * FROM customer ORDER BY full_name DESC;

--1. Name, gender and profession of all customers, ordered by name in descending order
SELECT * FROM customer;

--2. Customers who have the letter "R" in their name
--
--3. Customers whose name starts with the letter "C"
--
--4. Customers whose name ends with the letter "A"
--
--5. Customers who live in the "Centro" neighborhood
--
--6. Customers who live in address complements that start with the letter "A"
--
--7. Only female customers
--
--8. Customers who did not provide CPF
--
--9. Name and profession of customers, ordered in ascending order by profession name
--
--10. Customers with "Brazilian" nationality
--
--11. Customers who provided the house number
--
--12. Customers who live in Santa Catarina
--
--13. Customers born between 01/01/2000 and 01/01/2002
--
--14. Customer name and concatenated street address, number, complement, neighborhood, city and state of all customers


-- Additional Commands

-- Extracting day, month or year from a date

SELECT * FROM orders;
SELECT
    order_date AS "Order date",
    EXTRACT(DAY FROM order_date) AS "Day",
    EXTRACT(MONTH FROM order_date) AS "Month",
    EXTRACT(YEAR FROM order_date) AS "Year"
FROM orders;


-- Extracting characters from a string

SELECT
    full_name,
    SUBSTRING(full_name FROM 1 FOR 3) AS "Only these", -- Only from 1st to 3rd character
    SUBSTRING(full_name FROM 4) AS "Without the first ones" -- Starting from the fourth
FROM customer;


-- Converting everything to uppercase

SELECT
    full_name,
    UPPER(full_name)
FROM customer;


-- Adding a message to NULL fields

SELECT
    full_name,
    COALESCE(cpf, 'CPF not informed')
FROM customer;


-- Conditional CASE

SELECT * FROM state;

SELECT
    abbreviation,
    CASE abbreviation
        WHEN 'RJ' THEN 'Rio de Janeiro'
        WHEN 'SP' THEN 'SÃO PAULO'
        ELSE 'Other'
    END AS "State name"
FROM state;
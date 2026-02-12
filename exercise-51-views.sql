-- Exercises - views

--1. Name, profession, nationality, complement, city, state, neighborhood, 
-- CPF, RG, birth date, gender (show "Male" or "Female"), street address, number and notes of customers.
CREATE VIEW customer_data AS
SELECT
    c.full_name AS customer,
    p.name AS profession,
    n.name AS nationality,
    ac.name AS address_complement,
    ct.name AS city,
    s.name AS state,
    nb.name AS neighborhood,
    c.cpf AS cpf,
    c.rg AS rg,
    c.birth_date AS birth_date,
    CASE c.gender
        WHEN 'F' THEN 'Female'
        ELSE 'Male'
    END AS gender,
    c.street_address,
    c.address_number,
    c.notes
FROM customer c
LEFT JOIN profession p ON c.profession_id = p.profession_id
LEFT JOIN nationality n ON c.nationality_id = n.nationality_id
LEFT JOIN address_complement ac ON c.complement_id = ac.complement_id
LEFT JOIN city ct ON c.city_id = ct.city_id
LEFT JOIN state s ON c.state_id = s.state_id
LEFT JOIN neighborhood nb ON c.neighborhood_id = nb.neighborhood_id;

SELECT * FROM customer_data WHERE customer = 'Amanda';
DROP VIEW customer_data;

--2. City name and state name and abbreviation.
CREATE VIEW city_state AS
SELECT
    ct.name AS city,
    s.name AS state,
    s.abbreviation AS state_abbreviation
FROM city ct
LEFT JOIN state s ON ct.state_id = s.state_id;

DROP VIEW city_state;

SELECT * FROM city_state WHERE city = 'São Paulo';
SELECT * FROM city_state;

--3. Product name, price and supplier name of products.
CREATE VIEW product_supplier AS
SELECT
    p.name AS product_name,
    p.price AS price,
    s.company_name AS supplier
FROM product p
LEFT JOIN supplier s ON p.supplier_id = s.supplier_id;

DROP VIEW product_supplier;

SELECT * FROM product_supplier WHERE product_name = 'Monitor';
SELECT * FROM product_supplier;

--4. Shipping company name, street address, number, state name and state abbreviation of shipping companies.
CREATE VIEW shipping_company_state AS
SELECT
    sc.name AS shipping_company,
    sc.street_address AS street_address,
    sc.address_number AS address_number,
    s.name AS state,
    s.abbreviation AS abbreviation
FROM shipping_company sc
LEFT JOIN city ct ON sc.city_id = ct.city_id
LEFT JOIN state s ON ct.state_id = s.state_id;

DROP VIEW shipping_company_state;

SELECT * FROM shipping_company_state WHERE abbreviation = 'SP';
SELECT * FROM shipping_company_state;
DROP VIEW shipping_company_state;

--5. Order date, total value, shipping company name, customer name and salesperson name of orders.
CREATE VIEW order_details AS
SELECT
    o.order_date AS order_date,
    o.total_value AS total_value,
    sc.name AS shipping_company,
    c.full_name AS customer,
    sp.name AS salesperson
FROM orders o
LEFT JOIN shipping_company sc ON sc.shipping_company_id = o.shipping_company_id
LEFT JOIN customer c ON c.customer_id = o.customer_id
LEFT JOIN salesperson sp ON sp.salesperson_id = o.salesperson_id;

SELECT * FROM order_details WHERE salesperson = 'Maria';

DROP VIEW order_details;

--6. Product name, quantity, unit price and total value of products in the order.
CREATE VIEW order_summary AS
SELECT
    p.name AS product,
    op.quantity AS quantity,
    op.unit_price AS unit_price,
    o.total_value AS order_total
FROM order_product op
LEFT JOIN product p ON op.product_id = p.product_id
LEFT JOIN orders o ON op.order_id = o.order_id;

DROP VIEW order_summary;

SELECT * FROM order_summary WHERE order_total < 1000;
SELECT * FROM order_summary;

DROP VIEW order_summary;
--1. Customer name, profession, nationality, street address, number, complement, neighborhood, city, and state.
SELECT * FROM customer;
SELECT
    c.full_name AS "Customer",
    p.name AS "Profession",
    n.name AS "Nationality",
    c.street_address AS "Address",
    c.address_number AS "Number",
    ac.name AS "Complement",
    nb.name AS "Neighborhood",
    ct.name AS "City",
    s.name AS "State"
FROM
    customer AS c
LEFT JOIN profession AS p ON c.profession_id = p.profession_id
LEFT JOIN nationality AS n ON c.nationality_id = n.nationality_id
LEFT JOIN address_complement AS ac ON c.complement_id = ac.complement_id
LEFT JOIN neighborhood AS nb ON c.neighborhood_id = nb.neighborhood_id
LEFT JOIN city AS ct ON c.city_id = ct.city_id
LEFT JOIN state AS s ON c.state_id = s.state_id;

--2. Product name, price, and supplier name.
SELECT * FROM product;
SELECT * FROM supplier;

SELECT 
    p.name AS "Product",
    p.price AS "Price",
    s.company_name AS "Supplier"
FROM product AS p
LEFT JOIN supplier AS s ON p.supplier_id = s.supplier_id;

--3. Shipping company name and city.
SELECT * FROM shipping_company;
SELECT 
    sc.name AS "Shipping Company",
    ct.name AS "City"
FROM shipping_company AS sc
LEFT JOIN city AS ct ON sc.city_id = ct.city_id;

--4. Order date, total value, customer name, shipping company name, and salesperson name.
SELECT * FROM orders;

SELECT
    o.order_date AS "Order Date",
    o.total_value AS "Total Value",
    c.full_name AS "Customer",
    sc.name AS "Shipping Company",
    sp.name AS "Salesperson"
FROM orders AS o
LEFT JOIN customer AS c ON o.customer_id = c.customer_id 
LEFT JOIN shipping_company AS sc ON o.shipping_company_id = sc.shipping_company_id 
LEFT JOIN salesperson AS sp ON o.salesperson_id = sp.salesperson_id;

--5. Product name, quantity, and unit price of products in the order.
SELECT * FROM order_product;

SELECT 
    p.name AS "Product",
    op.quantity AS "Quantity",
    op.unit_price AS "Unit Price"
FROM order_product AS op
LEFT JOIN product AS p ON op.product_id = p.product_id;

--6. Customer names and order dates of customers who placed any order (ordered by customer name).
SELECT 
    c.full_name AS "Customer Name",
    o.order_date AS "Order Date"
FROM orders AS o
LEFT JOIN customer AS c ON c.customer_id = o.customer_id
ORDER BY c.full_name;

--7. Customer names and order dates of all customers, regardless of whether they placed an order (ordered by customer name).
SELECT
    c.full_name AS "Customer Name",
    o.order_date AS "Order Date"
FROM orders AS o
RIGHT JOIN customer AS c ON c.customer_id = o.customer_id
ORDER BY c.full_name;

--8. City name and the number of customers living in that city.
SELECT 
    ct.name AS "City Name",
    COUNT(c.customer_id) AS "Customer Count"
FROM customer AS c
INNER JOIN city AS ct ON c.city_id = ct.city_id
GROUP BY ct.name;

--9. Supplier name and the number of products from each supplier.
SELECT
    s.company_name AS "Supplier Name",
    COUNT(p.product_id) AS "Product Count"
FROM product AS p 
INNER JOIN supplier AS s ON p.supplier_id = s.supplier_id
GROUP BY s.company_name;

--10. Customer name and the sum of order values (grouped by customer).
SELECT
    c.full_name AS "Customer Name",
    SUM(o.total_value) AS "Total Order Value"
FROM orders AS o
INNER JOIN customer AS c ON c.customer_id = o.customer_id 
GROUP BY c.full_name;

--11. Salesperson name and the sum of order values (grouped by salesperson).
SELECT
    sp.name AS "Salesperson Name",
    SUM(o.total_value) AS "Total Sales Value"
FROM orders AS o
INNER JOIN salesperson AS sp ON sp.salesperson_id = o.salesperson_id 
GROUP BY sp.name;

--12. Shipping company name and the sum of order values (grouped by shipping company).
SELECT
    sc.name AS "Shipping Company",
    SUM(o.total_value) AS "Total Shipping Value"
FROM orders AS o
INNER JOIN shipping_company AS sc ON sc.shipping_company_id = o.shipping_company_id
GROUP BY sc.name;

--13. Customer name and the number of orders for each customer (grouped by customer).
SELECT
    c.full_name AS "Customer Name",
    COUNT(o.order_id) AS "Order Count"
FROM orders AS o
INNER JOIN customer AS c ON c.customer_id = o.customer_id
GROUP BY c.full_name;

--14. Product name and the quantity sold (grouped by product).
SELECT
    p.name AS "Product Name",
    SUM(op.quantity) AS "Total Quantity Sold"
FROM order_product AS op
INNER JOIN product AS p ON p.product_id = op.product_id
GROUP BY p.name;

--15. Order date and the sum of product values in the order (grouped by order date).
SELECT
    o.order_date AS "Order Date",
    SUM(op.quantity * op.unit_price) AS "Daily Sales Total"
FROM orders AS o
INNER JOIN order_product AS op ON op.order_id = o.order_id
GROUP BY o.order_date;

--16. Order date and the quantity of products in the order (grouped by order date).
SELECT
    o.order_date AS "Order Date",
    SUM(op.quantity) AS "Daily Product Quantity"
FROM orders AS o
INNER JOIN order_product AS op ON op.order_id = o.order_id
GROUP BY o.order_date;
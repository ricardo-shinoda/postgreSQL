-- Exercises - subqueries

--1. Names of customers who live in the same city as Manoel. Manoel should not be shown.
SELECT
    full_name
FROM customer
WHERE
    city_id = (SELECT city_id FROM customer WHERE full_name = 'Manoel') 
    AND full_name != 'Manoel';

-- Correction:
-- Solution 1: With JOIN (more efficient)
SELECT c1.full_name
FROM customer c1
INNER JOIN customer c2 ON c1.city_id = c2.city_id
WHERE c2.full_name = 'Manoel'
  AND c1.full_name != 'Manoel';

-- Solution 2: With IN (safer for multiple Manoels)
SELECT full_name
FROM customer
WHERE city_id IN (SELECT city_id FROM customer WHERE full_name = 'Manoel')
  AND full_name != 'Manoel';

--2. Date and value of orders where the order value is less than the average of all orders.
SELECT 
    order_date,
    total_value
FROM orders
WHERE 
    total_value < (SELECT AVG(total_value) FROM orders);

--3. Date, value, customer and salesperson of orders that have 2 or more products.
SELECT
    order_date,
    total_value,
    customer_id,
    salesperson_id,
    (SELECT COUNT(order_id) FROM order_product op WHERE op.order_id = o.order_id) AS "Product count"
FROM orders o
WHERE (SELECT COUNT(order_id) FROM order_product op WHERE op.order_id = o.order_id) >= 2;

--4. Names of customers who live in the same city (city_id = 4) as shipping company BS Transportes.
SELECT
    full_name
FROM customer
WHERE city_id = (SELECT city_id FROM shipping_company WHERE name = 'BS. Transportes');

--5. Customer name and city of customers located in the same city as any shipping company.
SELECT
    c.full_name,
    (SELECT name FROM city WHERE city_id = c.city_id) AS city
FROM customer c
WHERE city_id IN (SELECT city_id FROM shipping_company);

--6. Update the order value by 5% for orders where the sum of the total value of products in that order is greater than the average total value
-- of all products in all orders.
SELECT
    order_id,
    total_value,
    total_value + (total_value * 0.05) AS "+5%",
    (SELECT AVG(total_value) FROM orders) AS "average"
FROM orders
WHERE total_value > (SELECT AVG(total_value) FROM orders);

--7. Customer name and number of orders made by the customer.
SELECT
    full_name,
    (SELECT COUNT(customer_id) FROM orders o WHERE c.customer_id = o.customer_id) AS "Order count"
FROM customer c;

--8. For review, redo the previous exercise (number 07) using GROUP BY and showing only customers who made at least one order.
SELECT
    c.full_name,
    COUNT(o.order_id) AS "Order count"
FROM customer c
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.full_name, c.customer_id
HAVING COUNT(o.order_id) > 0;
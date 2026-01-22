-- Subquery

-- Select date and value of orders where the value is greater than the average value of all orders
SELECT
    order_date,
    total_value
FROM orders
WHERE 
    total_value > (SELECT AVG(total_value) FROM orders);

-- Example using COUNT
SELECT 
    o.order_date,
    o.total_value,
    (SELECT SUM(quantity) FROM order_product op WHERE op.order_id = o.order_id) AS "Product quantity per order"
FROM orders o;

-- Example with UPDATE
-- (Note: The example appears to be incomplete in the original)
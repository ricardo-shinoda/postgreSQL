-- Sum of orders grouped by customer

SELECT customer_id, SUM(total_value) FROM orders GROUP BY customer_id ORDER BY customer_id;

--
SELECT customer_id, SUM(total_value) FROM orders GROUP BY customer_id HAVING SUM(total_value) > 500;
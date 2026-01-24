-- DEFAULT FIELDS

SELECT * FROM orders;

-- To update date column to bring the current date if no date is informed.
ALTER TABLE orders ALTER COLUMN order_date SET DEFAULT current_date;

-- To update value to 0 if no value is informed, ideia is to avoid value field with NULL
ALTER TABLE orders ALTER COLUMN total_value SET DEFAULT 0;

-- Testing
INSERT INTO orders (customer_id, shipping_company_id, salesperson_id)
VALUES (1, 1, 1);

INSERT INTO orders (customer_id, shipping_company_id, salesperson_id, order_date, total_value)
VALUES (1, 1, 1, '2019-04-25', 10000);
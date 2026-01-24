-- Index exercises
--1. Add indexes to the following tables and fields

--a. Order – order date
SELECT * FROM orders;

CREATE INDEX idx_orders_order_date ON orders (order_date);

--b. Product – name
SELECT * FROM product;

CREATE INDEX idx_product_name ON product(name);
-- Default values exercise

--1. Add default values to the order product table
SELECT * FROM order_product;

--a. Quantity with value 1
ALTER TABLE order_product ALTER COLUMN quantity SET DEFAULT 1;

--b. Unit price with value 0
ALTER TABLE order_product ALTER COLUMN unit_price SET DEFAULT 0;

--2. Add default value to the product table
SELECT * FROM product;

--a. Price with value 0
ALTER TABLE product ALTER COLUMN price SET DEFAULT 0;
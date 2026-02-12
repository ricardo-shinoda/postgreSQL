--1. Create a new role called "clerk"
CREATE ROLE clerk;

--2. Define only permissions for the new role to be able to select and insert
-- new orders (orders and order_product tables). All other access must be blocked.
GRANT SELECT, INSERT ON
	orders,
	order_product
TO clerk WITH GRANT OPTION;

--3. Create a new user associated with the new role
CREATE ROLE jose login PASSWORD '0000' IN ROLE clerk;

--4. Perform tests to verify that the permissions were applied correctly

SELECT * FROM orders; -- select ok.
SELECT * FROM customer; -- permission denied for table customer 
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM products;

-- Rank Function with Window Function

-- This is going to rank values using ROW_NUMBER
SELECT
	product_id,
	product_name,
	price,
	ROW_NUMBER() OVER (
		ORDER BY price DESC
	) AS ranking
FROM products
ORDER BY 4 ASC;

--This is going to rank values in a more proper way giving the same value for drawn values| RANK
SELECT
	product_id,
	product_name,
	price,
	RANK() OVER (
		ORDER BY price DESC
	) AS ranking
FROM products;

-- DENSE_RANK - Similar to rank, but it does not consider the draw, it keeps going to the next number in rank
SELECT 
	product_id,
	product_name,
	category,
	price,
	dense_rank() OVER (
		ORDER BY price DESC
	) AS ranking
FROM products;

-- Partition by
SELECT 
--	product_id,
	product_name,
	category,
	price,
	ROW_NUMBER() OVER (
		PARTITION BY category
		ORDER BY price DESC 
	) AS raking
FROM products
ORDER BY 4 ASC;

-- LEAD and LAG
-- LEAD -> Take the next line value and link to the actual line.
SELECT
	product_id,
	product_name,
	category,
	price,
	LEAD(price, 1) OVER(
		ORDER BY 4
	) AS next_value
FROM products;

-- LAG -> Take the actual line value and link to the next line.
SELECT
	product_id,
	product_name,
	category,
	price,
	LAG (price, 1) OVER(
		ORDER BY price
	) AS previous_value
FROM products;
	
	
	
	
	
	
	
	
	
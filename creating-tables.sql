-- 1. Create table Customers:
CREATE TABLE customers (
	customer_id serial NOT NULL, 
	first_name varchar(50) NOT NULL ,
	last_name varchar(50) NOT NULL ,
	email varchar(100) NOT NULL,
	country varchar(50) DEFAULT 'Unknown',
	signup_data date DEFAULT current_date,
	CONSTRAINT pk_customer_id_customers PRIMARY KEY (customer_id),
	CONSTRAINT un_customer_email_customers UNIQUE (email)
);

DROP TABLE customers;

-- 2. Create product table:
CREATE TABLE products (
	product_id serial NOT NULL,
	product_name varchar(100) NOT NULL,
	category varchar(50),
	price decimal(10, 2) NOT NULL,
	CONSTRAINT pk_products_product_id PRIMARY KEY (product_id),
	CONSTRAINT ck_products_price CHECK (price > 0)
);

DROP TABLE products;

-- 3. Create orders table:
CREATE TABLE orders (
	order_id serial NOT NULL,
	customer_id integer NOT NULL,
	product_id integer NOT NULL,
	quantity integer DEFAULT 1,
	order_date timestamp DEFAULT current_timestamp, 
	CONSTRAINT pk_orders_order_id PRIMARY KEY (order_id),
	CONSTRAINT fk_orders_customer_id FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
	CONSTRAINT fk_orders_product_id FOREIGN KEY (product_id) REFERENCES products(product_id),
	CONSTRAINT ck_orders_quantity CHECK (quantity > 0)
);

-- 4. inserting date into tables
INSERT INTO customers (first_name, last_name, email, country)
SELECT
	'DevUser_' || i,
	'Test_' || i,
	'user_' || i || '@data-engineering.io',
	(ARRAY['USA', 'Brazil', 'Germany', 'Japan', 'UK', 'Canada'])[floor(random() * 6 + 1)]
FROM generate_series(1, 1000) s(i);


INSERT INTO products (product_name, category, price)
SELECT 
	'Product_' || i,
	(ARRAY['Tech', 'Home', 'Office', 'Garden'])[floor(random() * 4 + 1)],
	(random() * 500 + 10)::decimal(10,2)
FROM generate_series(1, 100) s(i);

INSERT INTO orders (customer_id, product_id, quantity)
SELECT
	floor(random() * 1000 + 1),
	floor(random() * 100 + 1),
	floor(random() * 5 + 1)
FROM generate_series(1, 1000) s(i);

SELECT * FROM orders;
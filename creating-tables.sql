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

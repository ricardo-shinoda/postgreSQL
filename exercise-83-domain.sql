-- Domain exercise, alter all the tables created with new domain system.

-- Table address_complement:
SELECT * FROM address_complement;

ALTER TABLE address_complement ALTER COLUMN name TYPE short_name;

-- Table neighborhood:
SELECT * FROM neighborhood;

ALTER TABLE neighborhood ALTER COLUMN name TYPE median_name;

-- Table auditing
SELECT * FROM auditing;

-- Table customer:
SELECT * FROM customer;

ALTER TABLE customer ALTER COLUMN full_name TYPE long_name;
ALTER TABLE customer ALTER COLUMN cpf TYPE short_name;
ALTER TABLE customer ALTER COLUMN rg TYPE short_name;
ALTER TABLE customer ALTER COLUMN birth_date TYPE date;
ALTER TABLE customer ALTER COLUMN gender TYPE acronym;
ALTER TABLE customer ALTER COLUMN street_address TYPE long_name;
ALTER TABLE customer ALTER COLUMN address_number TYPE shortid;
ALTER TABLE customer ALTER COLUMN notes TYPE long_name;
ALTER TABLE customer ALTER COLUMN profession_id TYPE shortid;
ALTER TABLE customer ALTER COLUMN nationality_id TYPE shortid;
ALTER TABLE customer ALTER COLUMN complement_id TYPE shortid;
ALTER TABLE customer ALTER COLUMN neighborhood_id TYPE shortid;
ALTER TABLE customer ALTER COLUMN city_id TYPE shortid;
ALTER TABLE customer ALTER COLUMN state_id TYPE shortid;

-- Table Supplier
SELECT * FROM supplier;

ALTER TABLE supplier ALTER COLUMN company_name TYPE long_name;
ALTER TABLE supplier ALTER COLUMN contact_name TYPE median_name;
ALTER TABLE supplier ALTER COLUMN phone TYPE median_name;
ALTER TABLE supplier ALTER COLUMN email TYPE median_name;
ALTER TABLE supplier ALTER COLUMN city_id TYPE shortid;

-- Table City
SELECT * FROM city;

ALTER TABLE city ALTER COLUMN name TYPE median_name;
ALTER TABLE city ALTER COLUMN state_id TYPE shortid;

-- Table nationality
SELECT * FROM nationality;

ALTER TABLE nationality ALTER COLUMN name TYPE long_name;

-- Table orders
SELECT * FROM orders;

ALTER TABLE orders ALTER COLUMN customer_id TYPE shortid;
ALTER TABLE orders ALTER COLUMN shipping_company_id TYPE shortid;
ALTER TABLE orders ALTER COLUMN salesperson_id TYPE shortid;
ALTER TABLE orders ALTER COLUMN order_date TYPE date;
ALTER TABLE orders ALTER COLUMN total_value TYPE currency;

-- Table order_product
SELECT * FROM order_product;

ALTER TABLE order_product ALTER COLUMN product_id TYPE shortid;
ALTER TABLE order_product ALTER COLUMN quantity TYPE medianid;
ALTER TABLE order_product ALTER COLUMN unit_price TYPE currency;

-- Table product
SELECT * FROM product;

ALTER TABLE product ALTER COLUMN supplier_id TYPE shortid;
ALTER TABLE product ALTER COLUMN name TYPE long_name;
ALTER TABLE product ALTER COLUMN price TYPE currency;

-- Table profession
SELECT * FROM profession;

ALTER TABLE profession ALTER COLUMN name TYPE median_name;

-- Table shipping company
SELECT * FROM shipping_company;

ALTER TABLE shipping_company ALTER COLUMN city_id TYPE shortid;
ALTER TABLE shipping_company ALTER COLUMN name TYPE long_name;
ALTER TABLE shipping_company ALTER COLUMN street_address TYPE long_name;
ALTER TABLE shipping_company ALTER COLUMN address_number TYPE code;

-- Table state
SELECT * FROM state;

ALTER TABLE state ALTER COLUMN name TYPE median_name;
ALTER TABLE state ALTER COLUMN abbreviation TYPE acronym;

-- Table salesperson
SELECT * FROM salesperson;

ALTER TABLE salesperson ALTER COLUMN name TYPE median_name;

	
	
	
	

	


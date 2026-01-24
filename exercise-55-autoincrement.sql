-- Auto increment exercise

--1. Create sequences for all other tables in the database

--a. Customer
SELECT max(customer_id) + 1 FROM customer;
CREATE SEQUENCE customer_id_seq MINVALUE 17;
ALTER TABLE customer ALTER customer_id SET DEFAULT nextval('customer_id_seq');
ALTER SEQUENCE customer_id_seq OWNED BY customer.customer_id;

--b Adding autoincrement function to a column in table complement

INSERT INTO address_complement (name) VALUES ('Cabin');


--c. Supplier
SELECT max(supplier_id) + 1 FROM supplier;
CREATE SEQUENCE supplier_id_seq MINVALUE 5;
ALTER TABLE supplier ALTER supplier_id SET DEFAULT nextval('supplier_id_seq');
ALTER SEQUENCE supplier_id_seq OWNED BY supplier.supplier_id;

-- testing
INSERT INTO supplier (company_name, contact_name, phone, email, city_id)
VALUES ('Linux', 'Lucas Shinoda', '(14)0000-1111', 'lucas@nasa.com', 4);

--d. City
SELECT max(city_id) + 1 FROM city;
CREATE SEQUENCE city_id_seq MINVALUE 11;
ALTER TABLE city ALTER city_id SET DEFAULT nextval('city_id_seq');
ALTER SEQUENCE city_id_seq OWNED BY city.city_id;

INSERT INTO city (name) VALUES ('Bauru');
UPDATE city SET state_id = 2 WHERE name = 'Bauru';

--e. Nationality
SELECT max(nationality_id) + 1 FROM nationality;
CREATE SEQUENCE nationality_id_seq MINVALUE 5;
ALTER TABLE nationality ALTER nationality_id SET DEFAULT nextval('nationality_id_seq');
ALTER SEQUENCE nationality_id_seq OWNED BY nationality.nationality_id;

INSERT INTO nationality (name) VALUES ('Japanese');

--f. Order
SELECT max(order_id) + 1 FROM orders; -- to get the next order_id value available.
CREATE SEQUENCE order_id_seq MINVALUE 16;
ALTER TABLE orders ALTER order_id SET DEFAULT nextval('order_id_seq');
ALTER SEQUENCE order_id_seq OWNED BY orders.order_id;

--g. Order product (check if necessary)
SELECT max(order_id) + 1 FROM order_product;
CREATE SEQUENCE order_product_id_seq MINVALUE 16;
ALTER TABLE order_product ALTER order_id SET DEFAULT nextval('order_product_id_seq');
ALTER SEQUENCE order_product_id_seq OWNED BY order_product.order_id;

--h. Profession
SELECT max(profession_id) + 1 FROM profession;
CREATE SEQUENCE profession_id_seq MINVALUE 6;
ALTER TABLE profession ALTER profession_id SET DEFAULT nextval('profession_id_seq');
ALTER SEQUENCE profession_id_seq OWNED BY profession.profession_id;

--i. Shipping company
SELECT max(shipping_company_id) + 1 FROM shipping_company;
CREATE SEQUENCE shipping_company_id_seq MINVALUE 5;
ALTER TABLE shipping_company ALTER shipping_company_id SET DEFAULT nextval('shipping_company_id_seq');
ALTER SEQUENCE shipping_company_id_seq OWNED BY shipping_company.shipping_company_id;

--j. State
SELECT max(state_id) +1 FROM state;
CREATE SEQUENCE state_id_seq MINVALUE 7;
ALTER TABLE state ALTER state_id SET DEFAULT nextval('state_id_seq');
ALTER SEQUENCE state_id_seq OWNED BY state.state_id;

--testing
SELECT * FROM state;
INSERT INTO state (name, abbreviation)
VALUES ('Bahia', 'BH');

--k. Salesperson
SELECT max(salesperson_id) + 1 FROM salesperson;
CREATE SEQUENCE salesperson_id_seq MINVALUE 9;
ALTER TABLE salesperson ALTER salesperson_id SET DEFAULT nextval('salesperson_id_seq');
ALTER SEQUENCE salesperson_id_seq OWNED BY salesperson.salesperson_id;
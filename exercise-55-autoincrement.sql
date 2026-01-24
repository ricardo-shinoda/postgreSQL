-- Auto increment exercise

--1. Create sequences for all other tables in the database
--a. Customer

SELECT * FROM customer;
SELECT max(customer_id) + 1 FROM customer;

CREATE SEQUENCE customer_id_seq MINVALUE 17;
ALTER TABLE customer ALTER customer_id SET DEFAULT nextval('customer_id_seq');
ALTER SEQUENCE customer_id_seq OWNED BY customer.customer_id;

--b Adding autoincrement function to a column in table
SELECT * FROM city;

SELECT max(city_id) + 1 FROM city;
CREATE SEQUENCE city_id_seq MINVALUE 11;
ALTER TABLE city ALTER city_id SET DEFAULT nextval('city_id_seq');
ALTER SEQUENCE city_id_seq OWNED BY city.city_id;

INSERT INTO city (name) VALUES ('Bauru');
UPDATE city SET state_id = 2 WHERE name = 'Bauru';

INSERT INTO address_complement (name) VALUES ('Cabin');


--c. Supplier
SELECT * FROM supplier;

SELECT max(supplier_id) + 1 FROM supplier;
CREATE SEQUENCE supplier_id_seq MINVALUE 5;
ALTER TABLE supplier ALTER supplier_id SET DEFAULT nextval('supplier_id_seq');
ALTER SEQUENCE supplier_id_seq OWNED BY supplier.supplier_id;

-- testing
INSERT INTO supplier (company_name, contact_name, phone, email, city_id)
VALUES ('Linux', 'Lucas Shinoda', '(14)0000-1111', 'lucas@nasa.com', 4);

--d. City
--
--e. Nationality
--
--f. Order
--
--g. Order product (check if necessary)
--
--h. Profession
--
--i. Shipping company
--
--j. State
--
--k. Salesperson
--Auto increment

SELECT * FROM customer;

CREATE TABLE example (
	example_id serial NOT NULL,
	name varchar(50) NOT NULL,
	CONSTRAINT pk_example_example_id PRIMARY KEY (example_id)
);

SELECT * FROM example;

INSERT INTO example (name) VALUES('Example 1');
INSERT INTO example (name) VALUES('Example 2');
INSERT INTO example (name) VALUES('Example 3');
INSERT INTO example (name) VALUES('Example 4');
INSERT INTO example (name) VALUES('Example 5');

-- updating all the other tables

SELECT * FROM address_complement;

-- 1. Create the sequence with proper starting value
CREATE SEQUENCE address_complement_complement_id_seq;

-- 2. Set sequence to start after current max value IMPORTANT: check if this is bringing the correct next id
SELECT setval('address_complement_complement_id_seq', 
	COALESCE((SELECT MAX(complement_id) FROM address_complement), 0) + 1);


-- Adding autoincrement function to a column in table
SELECT * FROM city;

SELECT max(city_id) + 1 FROM city;
CREATE SEQUENCE city_id_seq MINVALUE 11;
ALTER TABLE city ALTER city_id SET DEFAULT nextval('city_id_seq');
ALTER SEQUENCE city_id_seq OWNED BY city.city_id;

INSERT INTO city (name) VALUES ('Bauru');
UPDATE city SET state_id = 2 WHERE name = 'Bauru';

INSERT INTO address_complement (name) VALUES ('Cabin');
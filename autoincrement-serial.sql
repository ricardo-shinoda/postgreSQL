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

-- Procedures exercises
--
--1. Create a stored procedure that receives as parameters the product ID and the percentage increase,
--and adjusts the price of only this product according to the value passed as parameter.
SELECT * FROM product;

CREATE PROCEDURE increase_value (pdt_id integer, incr_value numeric) LANGUAGE SQL AS
$$
	update product set price = price + (price * incr_value) where product_id = pdt_id;
$$;

CALL increase_value(2, 0.50);

DROP PROCEDURE increase_value;


--2. Create a stored procedure that receives as parameter the product ID and deletes from the database only the product with the corresponding ID.


CREATE TABLE test (
	test_id integer NOT NULL,
	name varchar(20) NOT NULL
);

INSERT INTO test (test_id, name)
VALUES (1, 'test1'),
(2, 'test2'),
(3, 'test3'),
(4, 'test4');

SELECT * FROM test;

-- creating with a test table

CREATE PROCEDURE test_del (tst_id integer) LANGUAGE SQL AS
$$
	delete from test where test_id = tst_id;
$$;

CALL test_del(3);

CREATE PROCEDURE pdt_del (prd_id integer) LANGUAGE SQL AS
$$
	delete from product where product_id = prd_id;
$$;

CALL pdt_del(7);
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
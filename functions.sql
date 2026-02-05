-- Functions

SELECT total_value FROM orders;

-- concatenate

SELECT
	concat('$ ', round(total_value, 2))
FROM orders;
 

-- Creating the function to add the dollar sign before the number
CREATE FUNCTION value_format(value_amount numeric) RETURNS varchar(20) LANGUAGE plpgsql AS
$$
begin
	return concat('$ ', round(value_amount, 2));
end;
$$;

-- Calling the function
-- value_format = the function name I am calling
-- total_value = the column I want to bring to this function

SELECT
	total_value,
	value_format(total_value)
FROM orders;

-- Creating function to bring customer name according to customer Id (similar to join)

CREATE FUNCTION get_name(idc integer) RETURNS varchar(50) LANGUAGE plpgsql AS
$$
declare r varchar(50);
begin
	select full_name into r from customer where customer_id = idc;
	return r;
end;
$$;

SELECT order_date, total_value, customer_id, get_name(customer_id) FROM orders;


-- Deleting a funcion
DROP FUNCTION get_name;

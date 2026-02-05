--Exercises: Functions

--Create a function that receives the order ID as a parameter and returns the total_value of this order.
SELECT * FROM orders;

CREATE FUNCTION get_total_value(value_id integer) RETURNS NUMERIC(10,2) LANGUAGE plpgsql AS 
$$
declare order_total numeric(10,2);
begin
	select total_value into order_total from orders where order_id = value_id;
	return order_total;
end;
$$;

SELECT get_total_value(4);

DROP FUNCTION get_total_value;

CREATE FUNCTION get_value(vl_id integer) RETURNS varchar(20) LANGUAGE plpgsql AS 
$$
begin
	return (select value_format(total_value) from orders ord where ord.order_id = vl_id); 
end;
$$;

SELECT get_value(order_id) FROM orders;

DROP FUNCTION get_value;

--Create a function called "largest" (or "highest"), which when executed returns the order with the greatest value.

CREATE FUNCTION largest() RETURNS numeric(10,2) LANGUAGE plpgsql AS
$$
declare max_value numeric(10,2);
BEGIN
	select max(total_value) into max_value from orders;
	return max_value;
END;
$$;

SELECT largest();

DROP FUNCTION largest;

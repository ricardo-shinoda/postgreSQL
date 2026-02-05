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

--Create a function called "largest" (or "highest"), which when executed returns the order with the greatest value.
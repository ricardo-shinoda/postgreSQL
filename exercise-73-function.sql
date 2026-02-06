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
SELECT * FROM orders WHERE total_value = (SELECT max(total_value) FROM orders);

CREATE FUNCTION largest() RETURNS numeric(10,2) LANGUAGE plpgsql AS
$$
declare max_value numeric(10,2);
BEGIN
	select max(total_value) into max_value from orders;
	return max_value;
END;
$$;

SELECT largest();

CREATE FUNCTION highest() RETURNS integer LANGUAGE plpgsql AS
$$
begin
	return (select order_id from orders where total_value = (SELECT max(total_value) FROM orders));
end;
$$;

SELECT highest();

SELECT * FROM orders;

DROP FUNCTION highest;

DROP FUNCTION largest;

-- Extra exercise - Convert all names to capital letter

SELECT * FROM customer;
SELECT upper(full_name) FROM customer;

CREATE FUNCTION caps(name varchar) RETURNS varchar(50) LANGUAGE plpgsql AS
$$
BEGIN
	return (select upper(full_name) from customer ctm where ctm.full_name = name);
END;
$$;

-- testing function:
SELECT caps('Amanda');
SELECT caps(full_name) FROM customer;

DROP FUNCTION caps;

-- Create a function that formats CPF: XXX.XXX.XXX-XX
-- Input: '12345678912' → Output: '123.456.789-12'

SELECT * FROM customer;

CREATE FUNCTION format_cpf(cpf_data varchar) RETURNS varchar(20) LANGUAGE plpgsql AS
$$
BEGIN
	return 
	concat(substring(cpf_data from 1 for 3),
	'.',
	concat(substring(cpf_data from 4 for 3),
	'.',
	concat(substring(cpf_data from 7 for 3),
	'-',
	concat(substring(cpf_data from 10 for 2)
))));
END;
$$;


SELECT
	cpf,
	format_cpf(cpf)
FROM customer;

SELECT cpf FROM customer;

DROP FUNCTION format_cpf;


UPDATE customer SET cpf = '12345678909' WHERE customer_id = 1;
UPDATE customer SET cpf = '98765432100' WHERE customer_id = 2;
UPDATE customer SET cpf = '11122233396' WHERE customer_id = 3;
UPDATE customer SET cpf = '44455566677' WHERE customer_id = 4;
UPDATE customer SET cpf = '77788899912' WHERE customer_id = 5;
UPDATE customer SET cpf = '00011122235' WHERE customer_id = 6;
UPDATE customer SET cpf = '33344455568' WHERE customer_id = 7;
UPDATE customer SET cpf = '66677788891' WHERE customer_id = 8;
UPDATE customer SET cpf = '99900011123' WHERE customer_id = 9;
UPDATE customer SET cpf = '22233344456' WHERE customer_id = 10;
UPDATE customer SET cpf = '55566677789' WHERE customer_id = 11;
UPDATE customer SET cpf = '88899900001' WHERE customer_id = 12;
UPDATE customer SET cpf = '12131415163' WHERE customer_id = 13;
UPDATE customer SET cpf = '25262728294' WHERE customer_id = 14;
UPDATE customer SET cpf = '37383839304' WHERE customer_id = 15;
UPDATE customer SET cpf = '49494949485' WHERE customer_id = 16;

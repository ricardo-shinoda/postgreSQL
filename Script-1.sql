-- Triggers exercises
--
--1. Create a table called DELETED_ORDERS.
SELECT * FROM orders;

CREATE TABLE deleted_order (
	order_id integer NOT NULL,
	customer_id integer NOT NULL,
	shipping_company_id integer NOT NULL,
	salesperson_id integer NOT NULL,
	total_value numeric(10,2) NOT NULL,
	deletion_time timestamp NOT null
);

DELETE TABLE deleted_order;

--2. Create a trigger that when an order is deleted, all its data should be copied to the
--DELETED_ORDERS table.

CREATE OR REPLACE FUNCTION order_upl () RETURNS TRIGGER LANGUAGE plpgsql AS 
$$
BEGIN
	insert into deleted_order (
	order_id, 
	customer_id, 
	shipping_company_id, 
	sales_person_id, 
	total_value, 
	deletion_time)
	values (
	old.order_id,
	old.customer_id,
	old.shipping_company_id,
	old.salesperson_id,
	old.total_value,
	localtimestamp);
	return new;
END;
$$;

DELETE FUNCTION order_upl;

CREATE OR REPLACE TRIGGER order_upl AFTER DELETE ON orders FOR EACH ROW EXECUTE PROCEDURE order_upl();

-- testin trigger

SELECT * FROM deleted_order;
SELECT * FROM orders;

DELETE FROM orders WHERE order_id = 17;
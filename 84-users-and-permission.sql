-- users and permission

-- create roles

CREATE ROLE manager;
CREATE ROLE intern;

GRANT SELECT, INSERT ON 
	neighborhood,
	customer,
	address_complement,
	auditing,
	customer,
	supplier,
	city,
	nationality,
	orders,
	order_product,
	product,
	profession,
	shipping_company,
	state,
	salesperson
TO manager WITH GRANT OPTION;

GRANT SELECT ON 
	book_author_ian_graham,
	book_author_name
TO intern;

CREATE ROLE maria login PASSWORD '123' IN ROLE manager;
CREATE ROLE pedro login PASSWORD '321' IN ROLE intern;

SELECT * FROM customer;

UPDATE customer SET full_name = 'Lucas' WHERE customer_id = 2;
-- INDEX 

SELECT * FROM customer;

CREATE INDEX idx_customer_name ON customer (full_name);
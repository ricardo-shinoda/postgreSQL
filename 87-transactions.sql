-- Transactions

CREATE TABLE account (
	account_id serial NOT NULL,
	customer median_name NOT NULL,
	value currency NOT NULL  DEFAULT 0,
	CONSTRAINT pk_act_account_id PRIMARY KEY (account_id)
);

INSERT INTO account (customer, value) VALUES ('Customer 18', 1000);
INSERT INTO account (customer, value) VALUES ('Customer 2', 2000);

SELECT * FROM account;

UPDATE account SET value = value - 100 WHERE account_id = 1;
UPDATE account SET value = value + 100 WHERE account_id = 2;

BEGIN;
UPDATE account SET value = value - 100 WHERE account_id = 1;
UPDATE account SET value = value + 100 WHERE account_id = 2;
ROLLBACK; -- to revert the update above

BEGIN;
UPDATE account SET value = value - 100 WHERE account_id = 1;
UPDATE account SET value = value + 100 WHERE account_id = 2;
COMMIT; -- To execute the command
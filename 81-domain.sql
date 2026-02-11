-- Domain

--ids
CREATE DOMAIN shortid AS SMALLINT;
CREATE DOMAIN medianid AS integer;
CREATE DOMAIN longid AS bigint;

-- Charecters
CREATE DOMAIN acronym AS char(3);
CREATE DOMAIN code AS varchar(10);
CREATE DOMAIN short_name AS varchar(15);
CREATE DOMAIN median_name AS varchar(50);
CREATE DOMAIN long_name AS varchar(70);

-- Date/hour
CREATE DOMAIN date AS date;
CREATE DOMAIN HOUR AS time;
CREATE DOMAIN date_hour AS timestamp;

-- Numeric
CREATE DOMAIN currency AS numeric(10,2);
CREATE DOMAIN short_float AS numeric(6,2);
CREATE DOMAIN median_float AS numeric(10,2);
CREATE DOMAIN long_float AS numeric(15,2);

-- Applying the Domain into a column in a table
-- Ideally this should be done at the beggining of the data structure

ALTER TABLE neighborhood ALTER COLUMN name TYPE median_name;
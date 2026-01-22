-- Creating customer table and inserting values

CREATE TABLE customer (
    customer_id INTEGER NOT NULL,
    full_name VARCHAR(50) NOT NULL,
    cpf CHAR(14),
    rg VARCHAR(15),
    birth_date DATE,
    gender CHAR(1),
    profession VARCHAR(30),
    nationality VARCHAR(30),
    street_address VARCHAR(30),
    address_number VARCHAR(10),
    address_complement VARCHAR(30),
    neighborhood VARCHAR(30),
    city VARCHAR(30),
    state CHAR(2),
    notes TEXT,

    -- Primary key constraint
    CONSTRAINT pk_customer_customer_id PRIMARY KEY (customer_id)
);

-- Inserting initial customer data
INSERT INTO customer (customer_id, full_name, cpf, rg, birth_date, gender, profession, nationality, street_address, address_number, address_complement, neighborhood, city, state, notes) VALUES
(1, 'Manoel', '88828383821', '32323', '2001-10-10', 'M', 'Student', 'Brazilian', 'Rua Joaquim Nabuco', '23', 'House', 'Cidade Nova', 'Porto União', 'SC', NULL),
(2, 'Geraldo', '12343299291', '56565', '1987-04-01', 'M', 'Engineer', 'Brazilian', 'Rua das Limas', '200', 'Apartment', 'Centro', 'P. União', 'SC', NULL),
(3, 'Carlos', '87732323227', '55463', '1967-01-10', 'M', 'Construction Worker', 'Brazilian', 'Rua das Laranjeiras', '300', 'Apartment', 'Centro', 'Canoinhas', 'SC', NULL),
(4, 'Adriana', '12321222122', '98777', '1989-10-09', 'F', 'Journalist', 'Brazilian', 'Rua das Limas', '240', 'House', 'São Pedro', 'Porto Vitória', 'PR', NULL),
(5, 'Amanda', '99982838828', '28382', '1991-04-03', 'F', 'Journalist', 'Italian', 'Av. Central', '100', NULL, 'São Pedro', 'General Carneiro', 'PR', NULL),
(6, 'Ângelo', '99982828181', '12323', '2000-01-01', 'M', 'Teacher', 'Brazilian', 'Av. Beira Mar', '300', NULL, 'Centro', 'São Paulo', 'SP', NULL),
(7, 'Anderson', NULL, NULL, NULL, 'M', 'Teacher', 'Italian', 'Av. Brasil', '100', 'Apartment', 'Santa Rosa', 'Rio de Janeiro', 'SP', NULL),
(8, 'Camila', '9998282828', NULL, '2001-10-10', 'F', 'Teacher', 'North American', 'Rua Central', '4333', NULL, 'Centro', 'Uberlândia', 'MG', NULL),
(9, 'Cristiano', NULL, NULL, NULL, 'M', 'Student', 'German', 'Rua do Centro', '877', 'House', 'Centro', 'Porto Alegre', 'RS', NULL),
(10, 'Fabricio', '8828282828', '32323', NULL, 'M', 'Student', 'Brazilian', NULL, NULL, NULL, NULL, 'PU', 'SC', NULL),
(11, 'Fernanda', NULL, NULL, NULL, 'F', NULL, 'Brazilian', NULL, NULL, NULL, NULL, 'Porto União', 'SC', NULL),
(12, 'Gilmar', '88881818181', '888', '2000-10-02', 'M', 'Student', 'Brazilian', 'Rua das Laranjeiras', '200', NULL, 'C. Nova', 'Canoinhas', 'SC', NULL),
(13, 'Diego', '1010191919', '111939', NULL, 'M', 'Teacher', 'German', 'Rua Central', '455', 'House', 'Cidade N.', 'São Paulo', 'SP', NULL),
(14, 'Jeferson', NULL, NULL, '1983-01-07', 'M', NULL, 'Brazilian', NULL, NULL, NULL, NULL, 'União da Vitória', 'PR', NULL),
(15, 'Jessica', NULL, NULL, NULL, 'F', 'Student', NULL, NULL, NULL, NULL, NULL, 'União da Vitória', 'PR', NULL);

-- Inserting additional customer
INSERT INTO customer (customer_id, full_name, cpf, rg, birth_date, gender, profession, nationality, street_address, address_number, address_complement, neighborhood, city, state, notes) VALUES
(16, 'Getúlio', NULL, '4631', NULL, 'M', 'Student', 'Brazilian', 'Rua Central', '343', 'Apartment', 'Centro', 'Curitiba', 'PR', NULL);

--SELECT * FROM customer WHERE full_name LIKE 'Getúlio';

-- Updating customer data
UPDATE customer SET cpf = '1234567890' WHERE customer_id = 16;
UPDATE customer SET birth_date = '1978-01-04' WHERE customer_id = 16;

-- Creating profession table and inserting values
CREATE TABLE profession (
    profession_id INTEGER NOT NULL,
    name VARCHAR(30) NOT NULL,
    CONSTRAINT pk_profession_profession_id PRIMARY KEY (profession_id),
    CONSTRAINT un_profession_name UNIQUE (name)
);

INSERT INTO profession (profession_id, name) VALUES
(1, 'Student'),
(2, 'Engineer'),
(3, 'Construction Worker'),
(4, 'Journalist'),
(5, 'Teacher');

--SELECT * FROM profession;

-- Creating nationality table and inserting values
CREATE TABLE nationality (
    nationality_id INTEGER NOT NULL,
    name VARCHAR(30) NOT NULL,
    CONSTRAINT pk_nationality_nationality_id PRIMARY KEY (nationality_id),
    CONSTRAINT un_nationality_name UNIQUE (name)
);

INSERT INTO nationality (nationality_id, name) VALUES
(1, 'Brazilian'),
(2, 'Italian'),
(3, 'North American'),
(4, 'German');

--SELECT * FROM nationality;

-- Creating complement table and inserting values
CREATE TABLE address_complement (
    complement_id INTEGER NOT NULL,
    name VARCHAR(50) NOT NULL,
    CONSTRAINT pk_complement_complement_id PRIMARY KEY (complement_id),
    CONSTRAINT pk_complement_name UNIQUE (name)
);

-- Updating constraint name
ALTER TABLE address_complement RENAME CONSTRAINT pk_complement_name TO un_complement_name;

INSERT INTO address_complement (complement_id, name) VALUES 
(1, 'House'),
(2, 'Apartment');

--SELECT * FROM address_complement;

-- Creating neighborhood table and inserting values
CREATE TABLE neighborhood (
    neighborhood_id INTEGER NOT NULL,
    name VARCHAR(30) NOT NULL,
    CONSTRAINT pk_neighborhood_neighborhood_id PRIMARY KEY (neighborhood_id),
    CONSTRAINT un_neighborhood_name UNIQUE (name)
);

ALTER TABLE neighborhood RENAME CONSTRAINT pn_bair_nome TO un_neighborhood_name;

INSERT INTO neighborhood (neighborhood_id, name) VALUES 
(1, 'Cidade Nova'),
(2, 'Centro'),
(3, 'São Pedro'),
(4, 'Santa Rosa');

--SELECT * FROM customer;

-- Modifying table structure
ALTER TABLE customer DROP profession; -- but first we need to copy existing values

ALTER TABLE customer ADD profession_id INTEGER;
ALTER TABLE customer ADD CONSTRAINT fk_customer_profession_id FOREIGN KEY (profession_id) REFERENCES profession (profession_id);

UPDATE customer SET profession_id = 1 WHERE customer_id IN (1, 9, 10, 12, 15, 16);
-- Student -> 1, 9, 10, 12, 15, 16
UPDATE customer SET profession_id = 2 WHERE customer_id = 2;
-- Engineer -> 2
UPDATE customer SET profession_id = 3 WHERE customer_id = 3;
-- Construction Worker -> 3
UPDATE customer SET profession_id = 4 WHERE customer_id IN (4, 5);
-- Journalist -> 4, 5
UPDATE customer SET profession_id = 5 WHERE customer_id IN (6, 7, 8, 13);
-- Teacher -> 6, 7, 8, 13
UPDATE customer SET profession_id = NULL WHERE customer_id IN (11, 14);
-- NULL -> 11, 14

--SELECT * FROM customer;

-- First create the new nationality_id column
ALTER TABLE customer ADD COLUMN nationality_id INTEGER;
ALTER TABLE customer ADD CONSTRAINT fk_customer_nationality_id FOREIGN KEY (nationality_id) REFERENCES nationality (nationality_id);

-- Update customers with nationality 'Brazilian'
UPDATE customer SET nationality_id = 1 WHERE nationality = 'Brazilian';

-- Update customers with nationality 'Italian'
UPDATE customer SET nationality_id = 2 WHERE nationality = 'Italian';

-- Update customers with nationality 'North American'
UPDATE customer SET nationality_id = 3 WHERE nationality = 'North American';

-- Update customers with nationality 'German'
UPDATE customer SET nationality_id = 4 WHERE nationality = 'German';

-- Delete the old nationality column
ALTER TABLE customer DROP COLUMN nationality;

--SELECT * FROM customer;

-- Alter table to add new address_complement_id column
ALTER TABLE customer ADD COLUMN complement_id INTEGER;
ALTER TABLE customer ADD CONSTRAINT fk_customer_complement_id FOREIGN KEY (complement_id) REFERENCES address_complement (complement_id);

-- Update new complement_id column according to previous values from address_complement
UPDATE customer SET complement_id = 1 WHERE address_complement = 'House';
UPDATE customer SET complement_id = 2 WHERE address_complement = 'Apartment' OR address_complement = 'Ap.' OR address_complement = 'Apart.';

-- Remove old address_complement column
ALTER TABLE customer DROP COLUMN address_complement;

--SELECT * FROM neighborhood;
-- 1 - Cidade Nova | 2 - Centro | 3 - São Pedro | 4 - Santa Rosa

-- Adding neighborhood_id column and foreign key constraint
ALTER TABLE customer ADD COLUMN neighborhood_id INTEGER;
ALTER TABLE customer ADD CONSTRAINT fk_customer_neighborhood_id FOREIGN KEY (neighborhood_id) REFERENCES neighborhood (neighborhood_id);

UPDATE customer SET neighborhood_id = 1 WHERE neighborhood = 'Cidade Nova' OR neighborhood = 'Cidade N.' OR neighborhood = 'C. Nova';
UPDATE customer SET neighborhood_id = 2 WHERE neighborhood = 'Centro' OR neighborhood = 'Ctr.' OR neighborhood = 'Cto';
UPDATE customer SET neighborhood_id = 3 WHERE neighborhood = 'São Pedro';
UPDATE customer SET neighborhood_id = 4 WHERE neighborhood = 'Santa Rosa';

ALTER TABLE customer DROP neighborhood;

CREATE TABLE city (
    city_id INTEGER,
    name VARCHAR(50),
    CONSTRAINT pk_city_city_id PRIMARY KEY (city_id),
    CONSTRAINT un_city_name UNIQUE (name)
);

INSERT INTO city (city_id, name) VALUES
(1, 'General Carneiro'),
(2, 'Porto Vitória'),
(3, 'Rio de Janeiro'),
(4, 'União da Vitória'),
(5, 'Porto União'),
(6, 'Canoinhas'),
(7, 'São Paulo'),
(8, 'Uberlândia'),
(9, 'Porto Alegre'),
(10, 'Curitiba');



ALTER TABLE customer ADD COLUMN city_id INTEGER;
ALTER TABLE customer ADD CONSTRAINT fk_customer_city_id FOREIGN KEY (city_id) REFERENCES city (city_id);

UPDATE customer SET city_id = 1 WHERE city = 'General Carneiro';
UPDATE customer SET city_id = 2 WHERE city IN ('Porto Vitória', 'P. Vitória');
UPDATE customer SET city_id = 3 WHERE city IN ('Rio de Janeiro');
UPDATE customer SET city_id = 4 WHERE city IN ('União da Vitória');
UPDATE customer SET city_id = 5 WHERE city IN ('Porto União', 'P. União', 'PU');
UPDATE customer SET city_id = 6 WHERE city IN ('Canoinhas');
UPDATE customer SET city_id = 7 WHERE city IN ('São Paulo');
UPDATE customer SET city_id = 8 WHERE city IN ('Uberlândia');
UPDATE customer SET city_id = 9 WHERE city IN ('Porto Alegre');
UPDATE customer SET city_id = 10 WHERE city IN ('Curitiba');

ALTER TABLE customer DROP COLUMN city;

CREATE TABLE state (
    state_id INTEGER NOT NULL,
    name VARCHAR(30) NOT NULL,
    abbreviation CHAR(2) NOT NULL,
    CONSTRAINT pk_state_state_id PRIMARY KEY (state_id),
    CONSTRAINT un_state_name UNIQUE (name),
    CONSTRAINT un_state_abbreviation UNIQUE (abbreviation)
);

INSERT INTO state (state_id, name, abbreviation) VALUES
(1, 'Paraná', 'PR'),
(2, 'São Paulo', 'SP'),
(3, 'Santa Catarina', 'SC'),
(4, 'Minas Gerais', 'MG'),
(5, 'Rio Grande do Sul', 'RS'),
(6, 'Rio de Janeiro', 'RJ');

ALTER TABLE customer ADD COLUMN state_id INTEGER;

UPDATE customer SET state_id = 1 WHERE state = 'PR';
UPDATE customer SET state_id = 2 WHERE state = 'SP';
UPDATE customer SET state_id = 3 WHERE state = 'SC';
UPDATE customer SET state_id = 4 WHERE state = 'MG';
UPDATE customer SET state_id = 5 WHERE state = 'RS';

ALTER TABLE customer DROP COLUMN state;

-- Creating shipping_company table
CREATE TABLE shipping_company (
    shipping_company_id INTEGER NOT NULL,
    city_id INTEGER NOT NULL,
    name VARCHAR(50) NOT NULL,
    street_address VARCHAR(50) NOT NULL,
    address_number VARCHAR(10) NOT NULL,
    CONSTRAINT pk_shipping_company_shipping_company_id PRIMARY KEY (shipping_company_id),
    CONSTRAINT uk_shipping_company_name UNIQUE (name),
    CONSTRAINT fk_shipping_company_city_id FOREIGN KEY (city_id) REFERENCES city (city_id)
);

INSERT INTO shipping_company (shipping_company_id, name, street_address, address_number, city_id) VALUES
(1, 'BS Transportes', 'Rua das Transportadoras', '100', 5),  -- Porto União (city_id = 5)
(2, 'União Transportes', 'Avenida Principal', '200', 4),      -- União da Vitória (city_id = 4)
(3, 'Expresso Brasil', 'Rua Comercial', '300', 7),            -- São Paulo (city_id = 7)
(4, 'Rápido Transporte', 'Travessa Central', '50', 10); 

-- Creating salesperson table
CREATE TABLE salesperson (
    salesperson_id INTEGER NOT NULL,
    name VARCHAR(50) NOT NULL,
    CONSTRAINT pk_salesperson_salesperson_id PRIMARY KEY (salesperson_id),
    CONSTRAINT uk_salesperson_name UNIQUE (name)
);

INSERT INTO salesperson (salesperson_id, name) VALUES
(1, 'André'),
(2, 'Alisson'),
(3, 'José'),
(4, 'Catarina'),
(5, 'Maria'),
(6, 'Suelem'),
(7, 'Aline'),
(8, 'Silvana');

-- Creating orders table - VOLTAR AQUI
CREATE TABLE orders (
    order_id INTEGER NOT NULL,
    customer_id INTEGER NOT NULL,
    shipping_company_id INTEGER,
    salesperson_id INTEGER NOT NULL,
    order_date DATE NOT NULL,
    total_value NUMERIC(10,2) NOT NULL,
    CONSTRAINT pk_orders_order_id PRIMARY KEY (order_id),
    CONSTRAINT fk_orders_customer_id FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
    CONSTRAINT fk_orders_shipping_company_id FOREIGN KEY (shipping_company_id) REFERENCES shipping_company (shipping_company_id),
    CONSTRAINT fk_orders_salesperson_id FOREIGN KEY (salesperson_id) REFERENCES salesperson (salesperson_id)
);



-- Inserting data into orders table
INSERT INTO orders (order_id, order_date, total_value, customer_id, shipping_company_id, salesperson_id) VALUES
(1, '2008-04-01', 1300.00, 1, 1, 1),     -- Manoel, BS. Transportes, André
(2, '2008-04-01', 500.00, 1, 1, 1),      -- Manoel, BS. Transportes, André
(3, '2008-04-02', 300.00, 11, 2, 5),     -- Fernanda, União Transportes, Maria
(4, '2008-04-05', 1000.00, 8, 1, 7),     -- Camila, BS. Transportes, Aline
(5, '2008-04-06', 200.00, 9, 2, 6),      -- Cristiano, União Transportes, Suelem
(6, '2008-04-06', 1985.00, 10, 1, 6),    -- Fabrício, BS. Transportes, Suelem
(7, '2008-04-06', 800.00, 3, 1, 7),      -- Carlos, BS. Transportes, Aline
(8, '2008-04-06', 175.00, 3, 1, 7),      -- Carlos, BS. Transportes, Aline
(9, '2008-04-07', 1300.00, 12, 1, 8),    -- Gilmar, BS. Transportes, Silvana
(10, '2008-04-10', 200.00, 6, 1, 8),     -- Ângelo, BS. Transportes, Silvana
(11, '2008-04-15', 300.00, 15, 2, 1),    -- Jéssica, União Transportes, André
(12, '2008-04-20', 500.00, 15, 2, 5),    -- Jéssica, União Transportes, Maria
(13, '2008-04-20', 350.00, 9, 1, 7),     -- Cristiano, BS. Transportes, Aline
(14, '2008-04-23', 300.00, 13, 1, 5),    -- Diego, BS. Transportes, Maria
(15, '2008-04-25', 200.00, 11, 1, 5);    -- Fernanda, BS. Transportes, Maria

-- Creating supplier table (since it's referenced by product table)
CREATE TABLE supplier (
    supplier_id INTEGER NOT NULL,
    company_name VARCHAR(100) NOT NULL,
    contact_name VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR(100),
    city_id INTEGER,
    CONSTRAINT pk_supplier_supplier_id PRIMARY KEY (supplier_id),
    CONSTRAINT fk_supplier_city_id FOREIGN KEY (city_id) REFERENCES city (city_id)
);


CREATE TABLE product (
    product_id INTEGER NOT NULL,
    supplier_id INTEGER NOT NULL,
    name VARCHAR(50) NOT NULL,
    price NUMERIC(10, 2) NOT NULL,
    CONSTRAINT pk_product_product_id PRIMARY KEY (product_id),
    CONSTRAINT fk_product_supplier_id FOREIGN KEY (supplier_id) REFERENCES supplier (supplier_id)
);

-- Inserting data into supplier table
INSERT INTO supplier (supplier_id, company_name, contact_name, phone, city_id) VALUES
(1, 'TechComputers Ltda', 'Carlos Silva', '(11) 9999-8888', 7),      -- São Paulo
(2, 'Hardware Brasil SA', 'Ana Santos', '(41) 7777-6666', 10),       -- Curitiba
(3, 'Informática Express', 'Roberto Lima', '(47) 5555-4444', 5),     -- Porto União
(4, 'Componentes Eletrônicos', 'Fernanda Costa', '(48) 3333-2222', 6); -- Canoinhas

-- Inserting data into product table (matching the products in order_product)
INSERT INTO product (product_id, supplier_id, name, price) VALUES
(1, 1, 'Microcomputador', 800.00),       -- Computer
(2, 1, 'Monitor LCD 24"', 500.00),       -- Monitor
(3, 2, 'Placa Mãe ATX', 200.00),         -- Motherboard
(4, 2, 'HD 1TB SATA', 150.00),           -- Hard Drive
(5, 3, 'Placa de Vídeo GTX 1660', 200.00), -- Graphics Card
(6, 3, 'Memória RAM 8GB DDR4', 100.00),  -- RAM Memory
(7, 4, 'Gabinete ATX', 35.00),           -- Computer Case
(8, 1, 'Teclado Mecânico', 80.00),       -- Keyboard (additional)
(9, 2, 'Mouse Gamer', 45.00);            -- Mouse (additional)

CREATE TABLE order_product (
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    unit_price FLOAT NOT NULL,
    CONSTRAINT pk_order_product_order_product PRIMARY KEY (order_id, product_id),
    CONSTRAINT fk_order_product_order_id FOREIGN KEY (order_id) REFERENCES orders (order_id),
    CONSTRAINT fk_order_product_product_id FOREIGN KEY (product_id) REFERENCES product (product_id)
);

INSERT INTO order_product (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 800.00),   -- Order 1, Computer
(1, 2, 1, 500.00),   -- Order 1, Monitor
(2, 4, 2, 150.00),   -- Order 2, Hard Drive (2 units)
(3, 1, 1, 800.00),   -- Order 3, Computer
(3, 3, 1, 200.00),   -- Order 3, Motherboard
(4, 1, 2, 800.00),   -- Order 4, Computer (2 units)
(4, 7, 1, 35.00),    -- Order 4, Computer Case
(4, 5, 1, 200.00),   -- Order 4, Graphics Card
(5, 4, 1, 150.00),   -- Order 5, Hard Drive
(6, 1, 1, 800.00),   -- Order 6, Computer
(6, 7, 5, 35.00),    -- Order 6, Computer Case (5 units)
(7, 2, 1, 500.00),   -- Order 7, Monitor
(8, 5, 1, 200.00),   -- Order 8, Graphics Card
(9, 6, 1, 100.00),   -- Order 9, RAM Memory
(10, 2, 1, 500.00),  -- Order 10, Monitor
(11, 6, 1, 100.00),  -- Order 11, RAM Memory
(12, 3, 1, 200.00),  -- Order 12, Motherboard
(13, 4, 1, 150.00),  -- Order 13, Hard Drive
(14, 6, 3, 100.00),  -- Order 14, RAM Memory (3 units)
(15, 3, 1, 200.00);  -- Order 15, Motherboard

ALTER TABLE city ADD COLUMN state_id INTEGER;
ALTER TABLE city ADD CONSTRAINT fk_city_state_id FOREIGN KEY (state_id) REFERENCES state (state_id);

UPDATE city SET state_id = 1 WHERE name LIKE 'General Carneiro' OR name LIKE 'União da Vitória' OR name LIKE 'Curitiba';
UPDATE city SET state_id = 2 WHERE name LIKE 'São Paulo';
UPDATE city SET state_id = 3 WHERE name LIKE 'Porto Vitória' OR name LIKE 'Porto União' OR name LIKE 'Canoinhas';
UPDATE city SET state_id = 4 WHERE name LIKE 'Uberlândia';
UPDATE city SET state_id = 5 WHERE name LIKE 'Porto Alegre';
UPDATE city SET state_id = 6 WHERE name = 'Rio de Janeiro';
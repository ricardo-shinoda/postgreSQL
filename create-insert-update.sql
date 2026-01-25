
-- Criando tabela cliente e inserindo valores
CREATE table cliente (
	idcliente integer NOT NULL,
	nome varchar(50) NOT NULL,
	cpf char(14),
	rg varchar(15),
	data_nascimento date,
	genero char(1),
	profissao varchar(30),
	nacionalidade VARCHAR(30),
	logradouro varchar(30),
	numero varchar(10),
	complemento varchar(30),
	bairro varchar(30),
	municipio varchar(30),
	uf varchar(30),
	observacoes text,

	-- primary key
	CONSTRAINT pk_cln_idcliente PRIMARY KEY (idcliente)
);


INSERT INTO cliente (idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, uf, observacoes) VALUES
(1, 'Manoel', '88828383821', '32323', '2001-10-10', 'M', 'Estudante', 'Brasileira', 'Rua Joaquim Nabuco', '23', 'Casa', 'Cidade Nova', 'Porto União', 'SC', NULL),
(2, 'Geraldo', '12343299291', '56565', '1987-04-01', 'M', 'Engenheiro', 'Brasileira', 'Rua das Limas', '200', 'Ap.', 'Centro', 'P. União', 'SC', NULL),
(3, 'Carlos', '87732323227', '55463', '1967-01-10', 'M', 'Pedreiro', 'Brasileira', 'Rua das Laranjeiras', '300', 'Apart.', 'Cto.', 'Canoinhas', 'SC', NULL),
(4, 'Adriana', '12321222122', '98777', '1989-10-09', 'F', 'Jornalista', 'Brasileira', 'Rua das Limas', '240', 'Casa', 'São Pedro', 'Porto Vitória', 'PR', NULL),
(5, 'Amanda', '99982838828', '28382', '1991-04-03', 'F', 'Jorn.', 'Italiana', 'Av. Central', '100', NULL, 'São Pedro', 'General Carneiro', 'PR', NULL),
(6, 'Ângelo', '99982828181', '12323', '2000-01-01', 'M', 'Professor', 'Brasileiro', 'Av. Beira Mar', '300', NULL, 'Ctr.', 'São Paulo', 'SP', NULL),
(7, 'Anderson', NULL, NULL, NULL, 'M', 'Prof.', 'Italiano', 'Av. Brasil', '100', 'Apartamento', 'Santa Rosa', 'Rio de Janeiro', 'SP', NULL),
(8, 'Camila', '9998282828', NULL, '2001-10-10', 'F', 'Professora', 'Norte americana', 'Rua Central', '4333', NULL, 'Centro', 'Uberlândia', 'MG', NULL),
(9, 'Cristiano', NULL, NULL, NULL, 'M', 'Estudante', 'Alemã', 'Rua do Centro', '877', 'Casa', 'Centro', 'Porto Alegre', 'RS', NULL),
(10, 'Fabricio', '8828282828', '32323', NULL, 'M', 'Estudante', 'Brasileiro', NULL, NULL, NULL, NULL, 'PU', 'SC', NULL),
(11, 'Fernanda', NULL, NULL, NULL, 'F', NULL, 'Brasileira', NULL, NULL, NULL, NULL, 'Porto União', 'SC', NULL),
(12, 'Gilmar', '88881818181', '888', '2000-10-02', 'M', 'Estud.', 'Brasileiro', 'Rua das Laranjeiras', '200', NULL, 'C. Nova', 'Canoinhas', 'SC', NULL),
(13, 'Diego', '1010191919', '111939', NULL, 'M', 'Professor', 'Alemão', 'Rua Central', '455', 'Casa', 'Cidade N.', 'São Paulo', 'SP', NULL),
(14, 'Jeferson', NULL, NULL, '1983-01-07', 'M', NULL, 'Brasileiro', NULL, NULL, NULL, NULL, 'União da Vitória', 'PR', NULL),
(15, 'Jessica', NULL, NULL, NULL, 'F', 'Estudante', NULL, NULL, NULL, NULL, NULL, 'União da Vitória', 'PR', NULL);


INSERT INTO cliente (idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, uf, observacoes) VALUES
(16, 'Getúlio', NULL, '4631', NULL, 'M',  'Estudante', 'Brasileira', 'Rua Central', '343', 'Apartamento', 'Centro', 'Curitiba', 'PR', null);

--SELECT * FROM cliente WHERE nome LIKE 'Getúlio';

UPDATE cliente SET cpf = '1234567890' WHERE idcliente = 16;

UPDATE cliente SET data_nascimento = '1978-01-04' WHERE idcliente = 16;

-- Criando a tabela profissao e inserindo valores
CREATE TABLE profissao (
	idprofissao INTEGER NOT NULL,
	nome varchar(30) NOT NULL,
	CONSTRAINT pk_pro_idprofissao PRIMARY KEY (idprofissao),
	CONSTRAINT un_pro_nome UNIQUE (nome)
);

INSERT INTO profissao (idprofissao, nome) VALUES
(1, 'Estudante'),
(2, 'Engenheiro'),
(3, 'Pedreiro'),
(4, 'Jornalista'),
(5, 'Professor');

--SELECT * FROM profissao;


-- Criando a tabela nacionalidade e inserindo valores
CREATE TABLE nacionalidade (
	idnacionalidade INTEGER NOT NULL,
	nome VARCHAR(30) NOT NULL,
	CONSTRAINT pk_ncn_idnacionalidade PRIMARY KEY (idnacionalidade),
	CONSTRAINT un_ncn_nome UNIQUE (nome)
);

INSERT INTO nacionalidade (idnacionalidade, nome)
VALUES
(1, 'Brasileira'),
(2, 'Italiana'),
(3, 'Norte Americana'),
(4, 'Alemã');

--SELECT * FROM nacionalidade;

-- Criando a tabela complemento e inserindo valores
CREATE TABLE complemento (
	idcomplemento INTEGER NOT NULL,
	nome VARCHAR(50) NOT NULL,
	CONSTRAINT pk_com_idcomplemento PRIMARY KEY (idcomplemento),
	CONSTRAINT pk_com_nome UNIQUE (nome)
);

--updating constraint name:

ALTER TABLE complemento RENAME CONSTRAINT pn_com_nome TO un_com_nome;

INSERT INTO complemento (idcomplemento, nome)
VALUES 
(1, 'Casa'),
(2, 'apartamento');

--SELECT * FROM complemento;

-- Criando a tabela Bairro e inserindo valores
CREATE TABLE bairro (
	idbairro INTEGER NOT NULL,
	nome VARCHAR(30) NOT NULL,
	CONSTRAINT pk_bair_idbairro PRIMARY KEY (idbairro),
	CONSTRAINT pk_bairr_nome UNIQUE (nome)
);

ALTER TABLE bairro RENAME CONSTRAINT pn_bair_nome TO un_bair_nome;

INSERT INTO bairro (idbairro, nome)
VALUES 
(1, 'Cidade Nova'),
(2, 'Centro'),
(3, 'São Pedro'),
(4, 'Santa Rosa');

--SELECT * FROM cliente;


-- Alterar a estrutura de uma tabela
ALTER TABLE cliente DROP idprofissao; -- mas antes é preciso copiar os valores que estavam

ALTER TABLE cliente ADD idprofissao integer;

ALTER TABLE cliente ADD CONSTRAINT fk_cln_idprofissao FOREIGN KEY (idprofissao) REFERENCES profissao (idprofissao);

UPDATE cliente  SET idprofissao = 1 WHERE idcliente IN (1, 9, 10, 12, 15, 17);
-- Estudante -> 1, 9, 10, 12, 15, 17
UPDATE cliente  SET idprofissao = 2 WHERE idcliente = 2;
-- Engenheiro -> 2
UPDATE cliente  SET idprofissao = 3 WHERE idcliente = 3;
--Pedreiro -> 3
UPDATE cliente  SET idprofissao = 4 WHERE idcliente IN (4, 5);
--Jornalista -> 4, 5
UPDATE cliente  SET idprofissao = 5 WHERE idcliente IN (6, 7, 8, 13);
--Professor -> 6, 7, 8, 13
UPDATE cliente  SET idprofissao = NULL WHERE idcliente IN (11, 14);
--Null -> 11,14

--SELECT * FROM cliente;

-- primeiro criar a nova coluna de idnacionalidade:
ALTER TABLE cliente ADD COLUMN idnacionalidade INT;
ALTER TABLE cliente ADD CONSTRAINT fk_cln_idnacionalidade FOREIGN KEY (idnacionalidade) REFERENCES nacionalidade (idnacionalidade);

-- Atualiza clientes com nacionalidade 'Brasileira'
UPDATE cliente SET idnacionalidade = 1 WHERE nacionalidade = 'Brasileira';

-- Atualiza clientes com nacionalidade 'Italiana'
UPDATE cliente SET idnacionalidade = 2 WHERE nacionalidade = 'Italiana';

-- Atualiza clientes com nacionalidade 'Norte Americana'
UPDATE cliente SET idnacionalidade = 3 WHERE nacionalidade = 'Norte Americana';

-- Atualiza clientes com nacionalidade 'Alemã'
UPDATE cliente SET idnacionalidade = 4 WHERE nacionalidade = 'Alemã';

-- deletando a coluna antiga nacionalidade
ALTER TABLE cliente DROP COLUMN nacionalidade;

--SELECT * FROM cliente;

-- Altera a tabela para adicionar a nova coluna idcomplementos
ALTER TABLE cliente ADD COLUMN idcomplemento integer;
ALTER TABLE cliente ADD CONSTRAINT fk_cln_idcomplemento FOREIGN KEY (idcomplemento) REFERENCES complemento (idcomplemento);

-- update new column idcomplemento according to the previous values from complemento.
UPDATE cliente SET idcomplemento = 1 WHERE complemento = 'Casa';
UPDATE cliente SET idcomplemento = 2 WHERE complemento = 'Apartamento' OR complemento = 'Ap.' OR complemento = 'Apart.';

-- Remove old column complemento.
ALTER TABLE cliente DROP COLUMN complemento;

--SELECT * FROM bairro;
-- 1 - cidade nova | 2 - centro | 3 - São pedro | 4 - Santa rosa

-- adicionando a coluna idbairro e a constraint de foreign key
ALTER TABLE cliente ADD COLUMN idbairro int;
ALTER TABLE cliente ADD CONSTRAINT fk_cln_idbairro FOREIGN KEY (idbairro) REFERENCES bairro (idbairro);

UPDATE cliente SET idbairro = 1 WHERE bairro = 'Cidade Nova' OR bairro = 'Cidade N.' OR bairro = 'C. Nova';
UPDATE cliente SET idbairro = 2 WHERE bairro = 'Centro' OR bairro = 'Ctr.' OR bairro = 'Cto';
UPDATE cliente SET idbairro = 3 WHERE bairro = 'São Pedro';
UPDATE cliente SET idbairro = 4 WHERE bairro = 'Santa Rosa';

ALTER TABLE cliente DROP bairro;

CREATE TABLE municipio (
	idmunicipio integer,
	nome varchar(50),
	CONSTRAINT pk_mun_idmunicipio PRIMARY KEY (idmunicipio),
	CONSTRAINT un_mun_nome UNIQUE (nome)
);

INSERT INTO municipio (idmunicipio, nome) VALUES
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

UPDATE municipio SET ufid = 6 WHERE nome = 'Rio de Janeiro';

ALTER TABLE cliente ADD COLUMN idmunicipio integer;
ALTER TABLE cliente ADD CONSTRAINT fk_cln_idmunicio FOREIGN KEY (idmunicipio) REFERENCES municipio (idmunicipio);

UPDATE cliente SET idmunicipio = 1 WHERE municipio = 'General Carneiro';
UPDATE cliente SET idmunicipio = 2 WHERE municipio in ('Porto Vitória', 'P. Vitória');
UPDATE cliente SET idmunicipio = 3 WHERE municipio IN ('Rio de Janeiro');
UPDATE cliente SET idmunicipio = 4 WHERE municipio IN ('União da Vitória');
UPDATE cliente SET idmunicipio = 5 WHERE municipio IN ('Porto União', 'P. União', 'PU');
UPDATE cliente SET idmunicipio = 6 WHERE municipio IN ('Canoinhas');
UPDATE cliente SET idmunicipio = 7 WHERE municipio IN ('São Paulo');
UPDATE cliente SET idmunicipio = 8 WHERE municipio IN ('Uberlândia');
UPDATE cliente SET idmunicipio = 9 WHERE municipio IN ('Porto Alegre');
UPDATE cliente SET idmunicipio = 10 WHERE municipio IN ('Curitiba');

ALTER TABLE cliente DROP COLUMN municipio;


CREATE TABLE uf (
	iduf integer NOT NULL,
	nome varchar(30) NOT NULL,
	sigla char(2) NOT NULL,
	CONSTRAINT pk_uf_iduf PRIMARY KEY (iduf),
	CONSTRAINT un_uf_nome UNIQUE (nome),
	CONSTRAINT un_uf_sigla UNIQUE (sigla)
);

INSERT INTO uf (iduf, nome, sigla) VALUES
(1, 'Paraná', 'PR'),
(2, 'São Paulo', 'SP'),
(3, 'Santa Catarina', 'SC'),
(4, ' Minas Gerais', 'MG');
(5, 'Rio Grande do Sul', 'RS');
(6, 'Rio de Janeiro', 'RJ');



ALTER TABLE cliente ADD COLUMN iduf int;

UPDATE cliente SET iduf = 1 WHERE uf = 'PR';
UPDATE cliente SET iduf = 2 WHERE uf = 'SP';
UPDATE cliente SET iduf = 3 WHERE uf = 'SC';
UPDATE cliente SET iduf = 4 WHERE uf = 'MG';
UPDATE cliente SET iduf = 5 WHERE uf = 'RS';

ALTER TABLE cliente DROP COLUMN uf;

-- criando a tabela de pedidos

CREATE TABLE pedido (
	idpedido integer NOT NULL,
	idcliente integer NOT NULL,
	idtransportadora integer,
	idvendedor integer NOT NULL,
	data_pedido date NOT NULL,
	valor numeric(10,2) NOT NULL,
	CONSTRAINT pk_pdd_idpedido PRIMARY KEY (idpedido),
	CONSTRAINT fk_pdd_idcliente FOREIGN KEY (idcliente) REFERENCES cliente (idcliente),
	CONSTRAINT fk_pdd_idtransportadora FOREIGN KEY (idtransportadora) REFERENCES transportadora (idtransportadora),
	CONSTRAINT fk_pdd_idvendedor FOREIGN KEY (idvendedor) REFERENCES vendedor (idvendedor)
);

-- Inserindo os dados nas tabelas

INSERT INTO pedido (idpedido, data_pedido, valor, idcliente, idtransportadora, idvendedor)
VALUES
(1, '2008-04-01', 1300, 1, 1, 1),     -- Manoel, BS. Transportes, André
(2, '2008-04-01', 500, 1, 1, 1),      -- Manoel, BS. Transportes, André
(3, '2008-04-02', 300, 11, 2, 5),     -- Fernanda, União Transportes, Maria
(4, '2008-04-05', 1000, 8, 1, 7),     -- Camila, BS. Transportes, Aline
(5, '2008-04-06', 200, 9, 2, 6),      -- Cristiano, União Transportes, Suelem
(6, '2008-04-06', 1985, 10, 1, 6),    -- Fabrício, BS. Transportes, Suelem
(7, '2008-04-06', 800, 3, 1, 7),      -- Carlos, BS. Transportes, Aline
(8, '2008-04-06', 175, 3, 1, 7),      -- Carlos, BS. Transportes, Aline
(9, '2008-04-07', 1300, 12, 1, 8),    -- Gilmar, BS. Transportes, Silvana
(10, '2008-04-10', 200, 6, 1, 8),     -- Ângelo, BS. Transportes, Silvana
(11, '2008-04-15', 300, 15, 2, 1),    -- Jéssica, União Transportes, André
(12, '2008-04-20', 500, 15, 2, 5),    -- Jéssica, União Transportes, Maria
(13, '2008-04-20', 350, 9, 1, 7),     -- Cristiano, BS. Transportes, Aline
(14, '2008-04-23', 300, 13, 1, 5),    -- Diego, BS. Transportes, Maria
(15, '2008-04-25', 200, 11, 1, 5);    -- Fernanda, BS. Transportes, Maria

CREATE TABLE pedido_produto (
	idpedido integer NOT NULL,
	idproduto integer NOT NULL,
	quantidade integer NOT NULL,
	valor_unitario float NOT NULL,
	CONSTRAINT pk_pdp_idpedidoproduto PRIMARY KEY (idpedido, idproduto),
	CONSTRAINT fk_pdp_idpedido FOREIGN KEY (idpedido) REFERENCES pedido (idpedido),
	CONSTRAINT fk_pdp_idproduto FOREIGN KEY (idproduto) REFERENCES produto (idproduto)
);

INSERT INTO pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
VALUES
(1, 1, 1, 800),   -- Pedido 1, Microcomputador
(1, 2, 1, 500),   -- Pedido 1, Monitor
(2, 4, 2, 150),   -- Pedido 2, HD (2 unidades)
(3, 1, 1, 800),   -- Pedido 3, Microcomputador
(3, 3, 1, 200),   -- Pedido 3, Placa mãe
(4, 1, 2, 800),   -- Pedido 4, Microcomputador (2 unidades)
(4, 7, 1, 35),    -- Pedido 4, Gabinete
(4, 5, 1, 200),   -- Pedido 4, Placa de vídeo
(5, 4, 1, 150),   -- Pedido 5, HD
(6, 1, 1, 800),   -- Pedido 6, Microcomputador
(6, 7, 5, 35),    -- Pedido 6, Gabinete (5 unidades)
(7, 2, 1, 500),   -- Pedido 7, Monitor
(8, 5, 1, 200),   -- Pedido 8, Placa de vídeo
(9, 6, 1, 100),   -- Pedido 9, Memória RAM
(10, 2, 1, 500),  -- Pedido 10, Monitor
(11, 6, 1, 100),  -- Pedido 11, Memória RAM
(12, 3, 1, 200),  -- Pedido 12, Placa mãe
(13, 4, 1, 150),  -- Pedido 13, HD
(14, 6, 3, 100),  -- Pedido 14, Memória RAM (3 unidades)
(15, 3, 1, 200);

ALTER TABLE municipio ADD COLUMN ufid int;
ALTER TABLE municipio ADD CONSTRAINT fk_mun_ufid FOREIGN KEY (ufid) REFERENCES uf (iduf);

UPDATE municipio SET ufid = 1 WHERE nome LIKE 'General Carneiro' OR nome LIKE 'União da Vitória' OR nome LIKE 'Curitiba';
UPDATE municipio SET ufid = 2 WHERE nome LIKE 'São Paulo';
update municipio SET ufid = 3 WHERE nome LIKE 'Porto Vitória' OR nome LIKE 'Porto União' OR nome LIKE 'Canoinhas';
UPDATE municipio SET ufid = 4 WHERE nome LIKE 'Uberlândia';
UPDATE municipio SET ufid = 5 WHERE nome LIKE 'Porto Alegre';

-- FUNÇÕES AGREGADAS (count, sum, avg, etc...)

-- media

SELECT avg(valor) FROM pedido;



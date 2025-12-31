--Criar e inserir dados nas tabelas: fornecedor, vendedor, transportadora e produto

CREATE TABLE fornecedor (
	idfornecedor integer NOT NULL,
	nome varchar(50) NOT NULL,
	CONSTRAINT pk_fnc_idfornecedor PRIMARY KEY (idfornecedor),
	CONSTRAINT uk_fnc_nome UNIQUE (nome)
);

CREATE TABLE vendedor (
	idvendedor integer NOT NULL,
	nome varchar(50) NOT NULL,
	CONSTRAINT pk_vdd_idvendedor PRIMARY KEY (idvendedor),
	CONSTRAINT uk_vdd_nome UNIQUE (nome)
);

CREATE TABLE transportadora (
	idtransportadora integer NOT NULL,
	idmunicipio integer,
	nome varchar(50) NOT NULL,
	logradouro varchar(50),
	numero varchar(10),
	CONSTRAINT pk__trn_idtransportadora PRIMARY KEY (idtransportadora),
	CONSTRAINT fk_trn_idmunicio FOREIGN KEY (idmunicipio) REFERENCES municipio (idmunicipio),
	CONSTRAINT uk_trn_nome UNIQUE (nome)
);

CREATE TABLE produto (
	idproduto integer NOT NULL,
	idfornecedor integer NOT NULL,
	nome varchar(50) NOT NULL,
	valor numeric(10,2) NOT NULL,
	CONSTRAINT pk_prd_idproduto PRIMARY KEY (idproduto),
	CONSTRAINT fk_prd_idfornecedor FOREIGN KEY (idfornecedor) REFERENCES fornecedor (idfornecedor)
);

INSERT INTO vendedor (idvendedor, nome) VALUES
(1, 'Andre'),
(2, 'Alisson'),
(3, 'José'),
(4, 'Allion'),
(5, 'Maria'),
(6, 'Suelem'),
(7, 'Aline'),
(8, 'Silvana');

INSERT INTO Fornecedor (IdFornecedor, Nome) VALUES
(1, 'Cap. Computadores'),
(2, 'AA. Computadores'),
(3, 'BB. Máquinas');

SELECT * FROM municipio;

INSERT INTO Transportadora (IdTransportadora, IdMunicipio, Nome, Logradouro, Numero) VALUES
(1, 4, 'BS. Transportes', 'Rua das Limas', '01'),
(2, 7, 'União Transportes', NULL, NULL);

INSERT INTO Produto (IdProduto, IdFornecedor, Nome, Valor) VALUES
(1, 1, 'Microcomputador', 800.00),
(2, 1, 'Monitor', 500.00),
(3, 2, 'Placa mãe', 200.00),
(4, 2, 'HD', 150.00),
(5, 2, 'Placa de vídeo', 200.00),
(6, 3, 'Memória RAM', 100.00),
(7, 1, 'Gabinete', 35.00);
--Exercícios views

--1. O nome, a profissão, a nacionalidade, o complemento, o município, a unidade de federação, o bairro, 
-- o CPF,o RG, a data de nascimento, o gênero (mostrar “Masculino” ou “Feminino”), o logradouro, o número e as observações dos clientes.
CREATE VIEW dado_cliente AS
SELECT
	cln.nome AS cliente,
	prf.nome AS profissão,
	ncl.nome AS nacionalidade,
	cpl.nome AS complemento,
	mun.nome AS município,
	u.nome AS uf,
	bai.nome AS bairro,
	cln.cpf AS cpf,
	cln.rg AS rg,
	cln.data_nascimento AS nascimento,
	cln.genero AS Gênero
FROM cliente cln
LEFT JOIN profissao prf ON cln.idprofissao = prf.idprofissao
LEFT JOIN nacionalidade ncl ON cln.idnacionalidade = ncl.idnacionalidade
LEFT JOIN complemento cpl ON cln.idcomplemento = cpl.idcomplemento
LEFT JOIN municipio mun ON cln.idmunicipio = mun.idmunicipio
LEFT JOIN uf u ON cln.iduf = u.iduf
LEFT JOIN bairro bai ON cln.idbairro = bai.idbairro;

SELECT * FROM dado_cliente WHERE Cliente = 'Amanda';

--2. O nome do município e o nome e a sigla da unidade da federação.
CREATE VIEW address AS
SELECT
	mun.nome AS municipio,
	u.nome AS uf,
	u.sigla AS uf_sigla
FROM municipio mun
LEFT JOIN uf u ON mun.ufid = u.iduf;

SELECT * FROM address WHERE municipio = 'São Paulo';

--3. O nome do produto, o valor e o nome do fornecedor dos produtos.
CREATE VIEW produto_fornecedor as
SELECT
	prd.nome AS nome,
	prd.valor AS valor,
	frn.nome AS fornecedor
FROM produto prd
LEFT JOIN fornecedor frn ON prd.idfornecedor = frn.idfornecedor;

SELECT * FROM produto_fornecedor WHERE nome = 'Monitor';

SELECT * FROM produto;

--4. O nome da transportadora, o logradouro, o número, o nome da unidade de federação e a sigla da unidade de federação das transportadoras.
CREATE VIEW transportadora_estado AS
SELECT
	trn.nome AS transportadora,
	trn.logradouro AS logradouro,
	trn.numero AS numero,
	u.nome AS unidade_federacao,
	u.sigla AS sigla
FROM transportadora trn
LEFT JOIN uf u ON u.iduf = (SELECT ufid FROM municipio mun WHERE trn.idmunicipio = mun.idmunicipio);

SELECT * FROM transportadora_estado WHERE sigla = 'SP';

--5. A data do pedido, o valor, o nome da transportadora, o nome do cliente e o nome do vendedor dos pedidos.
CREATE VIEW pedidos as
SELECT
	pdd.data_pedido AS data_pedido,
	pdd.valor AS valor,
	trs.nome AS transportadora,
	cln.nome AS cliente,
	vdd.nome AS vendedor
FROM pedido pdd
LEFT JOIN transportadora trs ON trs.idtransportadora = pdd.idtransportadora
LEFT JOIN cliente cln ON cln.idcliente = pdd.idcliente
LEFT JOIN vendedor vdd ON vdd.idvendedor = pdd.idvendedor;

SELECT * FROM pedidos WHERE vendedor = 'Maria';

--6. O nome do produto, a quantidade, o valor unitário e o valor total dos produtos do pedido.
CREATE VIEW somatoria_pedido AS
SELECT
	prd.nome AS produto,
	pdp.quantidade AS quantidade,
	prd.valor AS valor_unitario,
	(SELECT sum(valor) FROM pedido pdd WHERE pdd.idpedido = pdp.idpedido) AS "total"
FROM pedido_produto pdp
LEFT JOIN produto prd ON pdp.idproduto = prd.idproduto;

SELECT * FROM somatoria_pedido WHERE total < 1000;





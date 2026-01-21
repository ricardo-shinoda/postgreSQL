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
--
--4. O nome da transportadora, o logradouro, o número, o nome da unidade de federação e a sigla da unidade de federação das transportadoras.
--
--5. A data do pedido, o valor, o nome da transportadora, o nome do cliente e o nome do vendedor dos pedidos.
--
--6. O nome do produto, a quantidade, o valor unitário e o valor total dos produtos do pedido.
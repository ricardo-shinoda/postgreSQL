--1. O nome do cliente, a profissão, a nacionalidade, o logradouro, o número, o complemento, o bairro, o município e a unidade de federação.
SELECT * FROM cliente;
SELECT
	cln.nome AS "Cliente",
	prf.nome AS "Profissão",
	ncl.nome AS "Nacionalidade",
	logradouro AS "Endereço",
	numero AS "Número",
	com.nome AS "Complemento",
	brr.nome AS "Bairro",
	mun.nome AS "Municíopio",
	uf.nome AS "Unidade de federação"
FROM
	cliente AS cln
LEFT JOIN profissao AS prf ON cln.idprofissao = prf.idprofissao
LEFT JOIN nacionalidade AS ncl ON cln.idnacionalidade = ncl.idnacionalidade
LEFT JOIN complemento AS com ON cln.idcomplemento = com.idcomplemento
LEFT JOIN bairro AS brr ON cln.idbairro = brr.idbairro
LEFT JOIN municipio AS mun ON cln.idmunicipio = mun.idmunicipio
LEFT JOIN uf ON cln.iduf = uf.iduf;

--2. O nome do produto, o valor e o nome do fornecedor.
SELECT * FROM produto;
SELECT * FROM fornecedor;

SELECT 
	prd.nome AS "Produto",
	prd.valor AS "Valor",
	frn.nome AS "Fornecedor"
FROM produto AS prd
LEFT JOIN fornecedor AS frn ON prd.idfornecedor = frn.idfornecedor;

--3. O nome da transportadora e o município.
SELECT * FROM transportadora;
SELECT 
	trn.nome AS "Nome da transportadora",
	mun.nome AS "Cidade"
FROM transportadora AS trn
LEFT JOIN municipio AS mun ON trn.idmunicipio = mun.idmunicipio;

--4. A data do pedido, o valor, o nome do cliente, o nome da transportadora e o nome do vendedor.
SELECT * FROM pedido;

SELECT
	pdd.data_pedido AS "Data do pedido",
	pdd.valor AS "Valor",
	cln.nome AS "Cliente",
	trn.nome AS "Transportadora",
	vdd.nome AS "Vendedor"
FROM pedido AS pdd
LEFT JOIN cliente AS cln ON pdd.idcliente = cln.idcliente 
LEFT JOIN transportadora AS trn ON pdd.idtransportadora = trn.idtransportadora 
LEFT JOIN vendedor AS vdd ON pdd.idvendedor = vdd.idvendedor;

--5. O nome do produto, a quantidade e o valor unitário dos produtos do pedido.
SELECT * FROM pedido_produto;

SELECT 
	prd.nome AS "Produto",
	ppr.quantidade AS "Quantidade",
	ppr.valor_unitario AS "Valor Unitário"
FROM pedido_produto AS ppr
LEFT JOIN produto AS prd ON ppr.idproduto = prd.idproduto;

--6. O nome dos clientes e a data do pedido dos clientes que fizeram algum pedido (ordenado pelo nome do cliente).
--SELECT * FROM pedido;
SELECT 
	cln.nome AS "Nome do cliente",
	pdd.data_pedido AS "Data do pedido"
FROM pedido AS pdd
LEFT JOIN cliente AS cln ON cln.idcliente = pdd.idcliente
ORDER BY cln.nome;

--7. O nome dos clientes e a data do pedido de todos os clientes, independente se tenham feito pedido (ordenado pelo nome do cliente).
SELECT * FROM pedido;

SELECT
	cln.nome AS "Nome do cliente",
	pdd.data_pedido AS "Data do pedido"
FROM pedido AS pdd
RIGHT JOIN cliente AS cln ON cln.idcliente = pdd.idcliente
ORDER BY cln.nome;

--8. O nome da cidade e a quantidade de clientes que moram naquela cidade.
--SELECT * FROM cliente;
--SELECT * FROM municipio;
SELECT 
	mun.nome AS "Nome da cidade",
--	count(cln.idmunicipio)
	count(cln.idmunicipio) AS "Quantidade"
FROM cliente AS cln
INNER JOIN municipio AS mun ON cln.idmunicipio = mun.idmunicipio
GROUP BY mun.nome;

--9. O nome do fornecedor e a quantidade de produtos de cada fornecedor.
SELECT * FROM produto;
SELECT * FROM fornecedor;

SELECT
	frn.nome AS "Nome do fornecedor",
	count(prd.idproduto) AS "Quantidade de produto"
FROM produto AS prd 
INNER JOIN fornecedor AS frn ON prd.idfornecedor = frn.idfornecedor
GROUP BY frn.nome;

--10.O nome do cliente e o somatório do valor do pedido (agrupado por cliente).
 SELECT * FROM pedido;
SELECT * FROM cliente;

SELECT
	cln.nome AS "Nome do cliente",
	sum(pdd.valor) AS "Somatória do valor por pedido"
FROM pedido AS pdd
INNER JOIN cliente AS cln ON cln.idcliente = pdd.idcliente 
GROUP BY cln.nome;

--11.O nome do vendedor e o somatório do valor do pedido (agrupado por vendedor).
SELECT * FROM pedido;

SELECT
	vnd.nome AS "nome do vendedor",
	sum(pdd.valor) AS "Somatória do valor"
FROM pedido AS pdd
INNER JOIN vendedor AS vnd ON vnd.idvendedor = pdd.idvendedor 
GROUP BY vnd.nome;

--12.O nome da transportadora e o somatório do valor do pedido (agrupado por transportadora).
SELECT * FROM transportadora;
SELECT * FROM pedido;
SELECT 
	trn.nome AS "Nome da transportadora",
	sum(pdd.valor) AS "Somatórioa do valor do pedido"
FROM pedido AS pdd
INNER JOIN transportadora AS trn ON pdd.idtransportadora = trn.idtransportadora 
GROUP BY trn.nome;

--13.O nome do cliente e a quantidade de pedidos de cada um (agrupado por cliente).
SELECT * FROM cliente;
SELECT * FROM pedido;

SELECT 
	cln.nome AS "Nome do cliente",
	sum(pdd.idpedido) AS "Somatória de quantidade de pedidos"
FROM pedido AS pdd
INNER JOIN cliente AS cln ON pdd.idcliente = cln.idcliente 
GROUP BY cln.nome;

--14.O nome do produto e a quantidade vendida (agrupado por produto).
SELECT * FROM produto;
SELECT * FROM pedido_produto;

SELECT 
	prd.nome AS "Nome do produto",
	count(ppd.quantidade) AS "Quantidade vendida"
FROM pedido_produto AS ppd
INNER JOIN produto AS prd ON ppd.idproduto = prd.idproduto
GROUP BY prd.nome;


--15.A data do pedido e o somatório do valor dos produtos do pedido (agrupado pela data do pedido).
SELECT * FROM pedido;
SELECT * FROM produto;
SELECT 
	pdd.data_pedido AS "Data do pedido",
	sum(pdd.valor) AS "Somatória do valor do produto"
FROM pedido AS pdd
GROUP BY pdd.data_pedido;


--16.A data do pedido e a quantidade de produtos do pedido (agrupado pela data do pedido).

SELECT
	pdd.data_pedido AS "Data do pedido",
	count(pdd.idcliente) AS "Quantidade de produtos por pedido"
FROM pedido AS pdd
GROUP BY pdd.data_pedido;
--Exercícios - subconsultas

--1. O nome dos clientes que moram na mesma cidade do Manoel. Não deve ser mostrado o Manoel.
SELECT
	nome	
FROM cliente
WHERE
	idmunicipio = (SELECT idmunicipio FROM cliente WHERE nome = 'Manoel') AND nome != 'Manoel';

--2. A data e o valor dos pedidos que o valor do pedido seja menor que a média de todos os pedidos.
SELECT 
	data_pedido,
	valor
FROM pedido
WHERE 
	valor < (SELECT avg(valor) FROM pedido);

--3. A data,o valor, o cliente e o vendedor dos pedidos que possuem 2 ou mais produtos.
SELECT
	data_pedido,
	valor,
	idcliente,
	idvendedor,
	(SELECT count(idpedido) FROM pedido_produto pdp WHERE pdp.idpedido = pdd.idpedido ) AS "Quantidade pedido"
FROM pedido pdd
WHERE (SELECT count(idpedido) FROM pedido_produto pdp WHERE pdp.idpedido = pdd.idpedido ) >= 2;

--4. O nome dos clientes que moram na mesma cidade (4) da transportadora BSTransportes.
SELECT
	nome
FROM cliente
WHERE idmunicipio = (SELECT idmunicipio FROM transportadora WHERE nome = 'BS. Transportes');

--5. O nome do cliente e o município dos clientes que estão localizados no mesmo município de qualquer uma das transportadoras.
SELECT
	clt.nome,
	(SELECT nome FROM municipio mun WHERE clt.idmunicipio = mun.idmunicipio)
FROM cliente clt
WHERE idmunicipio = (SELECT idmunicipio FROM transportadora trn WHERE clt.idmunicipio = trn.idmunicipio);

--6. Atualizar o valor do pedido em 5% para os pedidos que o somatório do valor total dos produtos daquele pedido seja maior que a média do valor total
--de todos os produtos de todos os pedidos.
SELECT
	idpedido,
	valor,
	valor + (valor * 0.05) AS "+5%",
	(SELECT avg(valor) FROM pedido) AS "media"
FROM pedido
WHERE valor > (SELECT avg(valor) FROM pedido);

--7. O nome do cliente e a quantidade de pedidos feitos pelo cliente.
SELECT
	nome,
	(SELECT count(idcliente) FROM pedido pdd WHERE cln.idcliente = pdd.idcliente) 
FROM cliente cln;

--8. Para revisar, refaça o exercício anterior (número 07) utilizando group by e mostrando somente os clientes que fizeram pelo menos um pedido.
SELECT
	cln.nome,
	(SELECT count(idcliente) FROM pedido pdd WHERE cln.idcliente = pdd.idcliente) AS "Quantidade"
FROM cliente cln
WHERE (SELECT count(idcliente) FROM pedido pdd WHERE cln.idcliente = pdd.idcliente) > 0
GROUP BY cln.nome, cln.idcliente;


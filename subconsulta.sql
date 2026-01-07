-- Subconsulta

-- selecionar data e valor do pedido onde o valor seja maior que a média de valores de todos os pedidos
SELECT
	data_pedido,
	valor
FROM pedido
WHERE 
	valor > (SELECT avg(valor) FROM pedido);

-- Exemplo usando COUNT
 SELECT 
 	pdd.data_pedido,
 	pdd.valor,
 	(SELECT sum(quantidade) FROM pedido_produto pdp WHERE pdp.idpedido = pdd.idpedido) AS "Quantidade produto por pedido"
 FROM pedido pdd;

-- Exemplo com update 
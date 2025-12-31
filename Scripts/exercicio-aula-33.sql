--Exercícios – funções agregadas


--1. A média dos valores de vendas dos vendedores que venderam mais que R$ 200,00.
SELECT * FROM pedido;
SELECT idvendedor, avg(valor) FROM pedido WHERE valor > 200 GROUP BY idvendedor;

--2. Os vendedores que venderam mais que R$ 1500,00.
SELECT idvendedor, valor FROM pedido WHERE valor > 1500;

--3. O somatório das vendas de cada vendedor.
SELECT idvendedor, sum(valor) FROM pedido GROUP BY idvendedor;

--4. A quantidade de municípios.
SELECT * FROM municipio;
SELECT count(idmunicipio) FROM municipio;

--5. A quantidade de municípios que são do Paraná ou de Santa Catarina.
SELECT * FROM uf;
SELECT count(idmunicipio) FROM municipio WHERE ufid IN (1, 3);

--6. A quantidade de municípios por estado.
SELECT * FROM uf;
SELECT count(nome) FROM uf GROUP BY sigla;

--7. A quantidade de clientes que informaram o logradouro.
SELECT count(logradouro) FROM cliente;

--8. A quantidade de clientes por município.
SELECT count(idcliente) FROM cliente GROUP BY idmunicipio;

--9. A quantidade de fornecedores.
SELECT * FROM fornecedor;
SELECT count(idfornecedor) AS "Quantidade de fornecedores" FROM fornecedor;

--10. A quantidade de produtos por fornecedor.
SELECT * FROM produto;
SELECT idfornecedor, count(idproduto) AS "Quantidade de produtos" FROM produto GROUP BY idfornecedor ORDER BY idfornecedor;

--11. A média de preços dos produtos do fornecedor Cap. Computadores (id = 1).
SELECT * FROM produto;
SELECT avg(valor) AS "Media de preço de produto do fornecedor Cap. Computadores" FROM  produto WHERE idfornecedor = 1;

--12. O somatório dos preços de todos os produtos.
SELECT sum(valor) FROM produto;

--13. O nome do produto e o preço somente do produto mais caro.
SELECT max(valor), nome FROM produto GROUP BY nome;
SELECT nome, valor FROM produto WHERE valor = (SELECT MAX(valor) FROM produto);

--14. O nome do produto e o preço somente do produto mais barato.
SELECT nome, valor FROM produto WHERE valor = (SELECT min(valor) FROM produto);

--15. A média de preço de todos os produtos.
SELECT avg(valor) FROM produto;

--16. A quantidade de transportadoras.
SELECT count(idtransportadora) FROM transportadora;

--17. A média do valor de todos os pedidos.
SELECT * FROM pedido;
SELECT avg(valor) FROM pedido;

--18. O somatório do valor do pedido agrupado por cliente.
SELECT idcliente, sum(valor) FROM pedido GROUP BY idcliente;

-- 19. O somatório do valor do pedido agrupado por vendedor.
SELECT * FROM pedido;
SELECT idvendedor, sum(valor) FROM pedido GROUP BY idvendedor;

--20. O somatório do valor do pedido agrupado por transportadora.
SELECT idtransportadora, sum(valor) FROM pedido GROUP BY idtransportadora;

--21. O somatório do valor do pedido agrupado pela data.
SELECT * FROM pedido;
SELECT data_pedido, sum(valor) FROM pedido GROUP BY data_pedido;

--22. O somatório do valor do pedido agrupado por cliente, vendedor e transportadora.
SELECT idcliente, idvendedor, idtransportadora, sum(valor) FROM pedido GROUP BY idcliente, idvendedor, idtransportadora;

--23. O somatório do valor do pedido que esteja entre 01/04/2008 e 10/12/2009 e que seja maior que R$ 200,00.
SELECT * FROM pedido;
SELECT idpedido, sum(valor) FROM pedido WHERE data_pedido BETWEEN '2008-04-01' AND '2009-12-10' GROUP BY idpedido HAVING sum(valor) > 200;

--24. A média do valor do pedido do vendedor André (1).
SELECT avg(valor) FROM pedido WHERE idvendedor = 1;

--25. A média do valor do pedido da cliente Jéssica (15).
SELECT * FROM cliente;
SELECT avg(valor) FROM pedido WHERE idcliente = 15;

--26. A quantidade de pedidos transportados pela transportadora BS. Transportes(1).
SELECT * FROM transportadora;
SELECT count(idpedido) FROM pedido WHERE idtransportadora = 1;

--27. A quantidade de pedidos agrupados por vendedor.
SELECT idvendedor, count(idpedido) FROM pedido GROUP BY idvendedor;

--28. A quantidade de pedidos agrupados por cliente.
SELECT idcliente, count(idpedido) FROM pedido GROUP BY idcliente;

--29. A quantidade de pedidos entre 15/04/2008 e 25/04/2008.
SELECT count(idpedido) FROM pedido WHERE data_pedido BETWEEN '2008-04-15' AND '2008-04-25';

--30. A quantidade de pedidos que o valor seja maior que R$ 1.000,00.
SELECT count(idpedido) FROM pedido WHERE valor > 1000;

--31. A quantidade de microcomputadores(1) vendida.
SELECT * FROM produto;
SELECT * FROM pedido_produto;
SELECT count(quantidade) FROM pedido_produto WHERE idproduto = 1;

--32. A quantidade de produtos vendida agrupado por produto.
SELECT idproduto, count(quantidade) FROM pedido_produto GROUP BY idproduto;

--33. O somatório do valor dos produtos dos pedidos, agrupado por pedido.
SELECT * FROM pedido_produto;
SELECT idpedido, sum(valor_unitario) FROM pedido_produto GROUP BY idpedido;

--34. A quantidade de produtos agrupados por pedido.
SELECT idpedido, count(idproduto) FROM pedido_produto GROUP BY idpedido;

--35. O somatório dos valores unitários de todos os produtos.
SELECT * FROM produto;
SELECT sum(valor) FROM produto;
SELECT sum(valor_unitario) FROM pedido_produto;

--36. A média dos produtos do pedido 6.
SELECT * FROM pedido_produto;
SELECT avg(valor_unitario) FROM pedido_produto WHERE idpedido = 6;

--37. O valor do maior produto do pedido.
SELECT * FROM pedido_produto;
SELECT idpedido, max(valor_unitario) FROM pedido_produto GROUP BY idpedido ORDER BY idpedido;
SELECT * FROM pedido_produto WHERE idpedido = 1; --contra prova

--38. O valor do menor produto do pedido.
SELECT idpedido, min(valor_unitario) FROM pedido_produto GROUP BY idpedido ORDER BY idpedido;
SELECT * FROM pedido_produto WHERE idpedido = 1; -- contra prova

--39. O somatório da quantidade de produtos por pedido.
SELECT idpedido, sum(quantidade) FROM pedido_produto GROUP BY idpedido ORDER BY idpedido;
SELECT * FROM pedido_produto WHERE idpedido = 6;

--40. O somatório da quantidade de todos os produtos do pedido.
SELECT * FROM pedido_produto;
SELECT idpedido, count(idproduto) FROM pedido_produto GROUP BY idpedido ORDER BY idpedido;
SELECT * FROM pedido_produto WHERE idpedido = 1; 
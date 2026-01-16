--1. Somente o nome de todos os vendedores em ordem alfabética.
SELECT nome FROM vendedor ORDER BY nome ASC;

--2. Os produtos que o preço seja maior que R$200,00, em ordem crescente pelo preço.
SELECT * FROM produto WHERE valor > 200 ORDER BY valor ASC;

--3. O nome do produto, o preço e o preço reajustado em 10%, ordenado pelo nome do produto.
SELECT nome, valor, valor + valor * 0.10 AS "Valor ajustado com 10%" FROM produto ORDER BY nome;

--4. Os municípios do Rio Grande do Sul.
SELECT * FROM municipio;
SELECT * FROM municipio WHERE ufid = 5;

--5. Os pedidos feitos entre 10/04/2008 e 25/04/2008 ordenado pelo valor.

SELECT * FROM pedido;
SELECT * FROM pedido WHERE data_pedido BETWEEN '2008-04-10' AND '2008-04-25';

--6. Os pedidos que o valor esteja entre R$1.000,00 e R$1.500,00.

SELECT * FROM pedido WHERE valor BETWEEN 1000 AND 1500;

--7. Os pedidos que o valor não esteja entre R$100,00 e R$500,00.

SELECT * FROM pedido WHERE valor NOT BETWEEN 100 AND 500;

--8. Os pedidos do vendedor André ordenado pelo valor em ordem decrescente.

SELECT * FROM vendedor;
SELECT * FROM pedido WHERE idvendedor = 1 ORDER BY valor DESC;

--9. Os pedidos do cliente Manoel ordenado pelo valor em ordem crescente.

SELECT * FROM cliente;
SELECT * FROM pedido WHERE idcliente = 1 ORDER BY valor ASC;

--10. Os pedidos da cliente Jéssica (15) que foram feitos pelo vendedor André (1).

SELECT * FROM vendedor;
SELECT * FROM pedido WHERE idcliente = 15 AND idvendedor = 1;

--11. Os pedidos que foram transportados pela transportadora União Transportes(2).

SELECT * FROM transportadora;
SELECT * FROM pedido WHERE idtransportadora = 1;

--12. Os pedidos feitos pela vendedora Maria(5) ou pela vendedora Aline(7).

SELECT * FROM vendedor;
SELECT * FROM pedido WHERE idvendedor = 1 OR idvendedor = 7;

--13. Os clientes que moram em União da Vitória ou Porto União.

SELECT * FROM municipio;

--14. Os clientes que não moram em União da Vitória (4) e nem em Porto União(2).

SELECT * FROM cliente WHERE idmunicipio NOT IN (2, 4);

--15. Os clientes que não informaram o logradouro.

SELECT * FROM cliente WHERE logradouro IS NULL;

--16. Os clientes que moram em avenidas.
SELECT * FROM cliente;
SELECT * FROM cliente WHERE logradouro LIKE 'Av.%';

--17. Os vendedores que o nome começa com a letra S.

SELECT * FROM vendedor WHERE nome LIKE 'S%';

--18. Os vendedores que o nome termina com a letra A.

SELECT * FROM vendedor WHERE nome LIKE '%a'

--19. Os vendedores que o nome não começa com a letra A.

SELECT * FROM vendedor WHERE nome NOT LIKE 'A%';

--20. Os municípios que começam com a letra P e são de Santa Catarina (3).

SELECT * FROM uf;
SELECT * FROM municipio WHERE nome LIKE 'P%' AND ufid = 3;

--21. As transportadoras que informaram o endereço.

SELECT * FROM transportadora WHERE nome IS NOT NULL;

--22. Os itens do pedido 01.

SELECT * FROM pedido WHERE idpedido = 1;

--23. Os itens do pedido 06 ou do pedido 10.

SELECT * FROM pedido WHERE idpedido = 6 OR idpedido = 10;


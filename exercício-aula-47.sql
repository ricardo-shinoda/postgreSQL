--Exercícios - subconsultas

--1. O nome dos clientes que moram na mesma cidade do Manoel. Não deve ser mostrado o Manoel.
SELECT
	nome	
FROM cliente
WHERE
	idmunicipio = (SELECT idmunicipio FROM cliente WHERE nome = 'Manoel') AND nome != 'Manoel';

--2. A data e o valor dos pedidos que o valor do pedido seja menor que a média de todos os pedidos.
--
--3. A data,o valor, o cliente e o vendedor dos pedidos que possuem 2 ou mais produtos.
--
--4. O nome dos clientes que moram na mesma cidade da transportadora BSTransportes.
--
--5. O nome do cliente e o município dos clientes que estão localizados no mesmo município de qualquer uma das transportadoras.
--
--6. Atualizar o valor do pedido em 5% para os pedidos que o somatório do valor total dos produtos daquele pedido seja maior que a média do valor total
--
--de todos os produtos de todos os pedidos.
--
--7. O nome do cliente e a quantidade de pedidos feitos pelo cliente.
--
--8. Para revisar, refaça o exercício anterior (número 07) utilizando group by e mostrando somente os clientes que fizeram pelo menos um pedido.
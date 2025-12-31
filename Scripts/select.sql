SELECT * FROM cliente;

--Renomeando uma coluna
SELECT nome, data_nascimento AS "Data de nascimento" FROM cliente;

-- concatenando dois campos
SELECT 'CPF: ' || cpf || ' RG: ' || rg AS "CPF e RG" FROM cliente;

-- Limitando a quantidade mostrada - somente os 5
SELECT * FROM cliente LIMIT	5;

-- Trazer os cliente que nasceram apos uma data
SELECT * FROM cliente WHERE data_nascimento > '2001-01-01';

-- Cliente com o nome começa com C
SELECT * FROM cliente WHERE nome LIKE 'C%';

-- Cliente que contenha a letra C no meio
SELECT * FROM cliente WHERE nome LIKE	'%c%';

-- Trazendo os clientes em ordem alfabética
SELECT * FROM cliente ORDER BY nome;

-- Trazendo os clientes em ordem alfabética decrescente
SELECT * FROM cliente ORDER BY nome DESC;

1. O nome, o gênero e a profissão de todos os clientes, ordenado pelo nome em ordem decrescente

2. Os clientes que tenham a letra “R” no nome

3. Os clientes que o nome inicia com a letra “C”

4. Os clientes que o nome termina com a letra “A”

5. Os clientes que moram no bairro “Centro”

6. Os clientes que moram em complementos que iniciam com a letra “A”

7. Somente os clientes do sexo feminino

8. Os clientes que não informaram o CPF

9. O nome e a profissão dos clientes, ordenado em ordem crescente pelo nome da profissão

10. Os clientes de nacionalidade “Brasileira”

11. Os clientes que informaram o número da residência

12. Os clientes que moram em Santa Catarina

13. Os clientes que nasceram entre 01/01/2000 e 01/01/2002

14. O nome do cliente e o logradouro, número, complemento, bairro, município e UF concatenado de todos os clientes
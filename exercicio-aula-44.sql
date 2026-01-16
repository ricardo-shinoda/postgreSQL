--Exercícios – comandos adicionais

--1. O nome do cliente e somente o mês de nascimento. Caso a data de nascimento não esteja preenchida mostrar a mensagem “Não informado”.
SELECT 
	nome,
	COALESCE(to_char(data_nascimento, 'MM'), 'Não informado') AS "Mês de nascimento"
FROM cliente;

--2. O nome do cliente e somente o nome do mês de nascimento (Janeiro, Fevereiro etc). Caso a data de nascimento não esteja preenchida mostrar a mensagem “Não informado”.
SELECT 
	nome,
	COALESCE(to_char(data_nascimento, 'Month'), 'Não informado') AS "Mês de nascimento"
FROM cliente;

--3. O nome do cliente e somente o ano de nascimento. Caso a data de nascimento não esteja preenchida mostrar a mensagem “Não informado”.
SELECT
	nome,
	COALESCE (EXTRACT(YEAR FROM data_nascimento)::text, 'Não informato') AS "Ano de nascimento"
FROM cliente;

--4. O caractere 5 até o caractere 10 de todos os municípios.
SELECT
	substring(nome FROM 5 FOR 10) AS "Somente o caracter 5 até 10"
FROM municipio;
	
--5. O nome de todos os municípios em letras maiúsculas.
SELECT
	upper(nome) AS "Município"
FROM municipio;

--6. O nome do cliente e o gênero. Caso seja M mostrar “Masculino”, senão mostrar “Feminino”.
SELECT
	nome,
	CASE genero
		WHEN 'F' THEN 'Feminino'
	ELSE 'Masculino'
	END AS "Gênero"
FROM cliente;

--7. O nome do produto e o valor. Caso o valor seja maior do que R$ 500,00 mostrar a mensagem “Acima de 500”, caso contrário, mostrar a mensagem “Abaixo de 500”.
SELECT
	nome,
	valor,
	CASE
		WHEN valor > 500 THEN 'Acima de 500'
		WHEN valor = 500 THEN 'Valor igual 500'
	ELSE 'Abaixo de 500'
	END AS "Valor acima ou abaixo de 500"
FROM produto;
--Exercícios – comandos adicionais

--1. O nome do cliente e somente o mês de nascimento. Caso a data de nascimento não esteja preenchida mostrar a mensagem “Não informado”.
SELECT * FROM cliente;

-- usando a formula TO_CHAR para converter data em texto:

SELECT 
	nome,
	COALESCE(to_char(data_nascimento, 'DD/MM/YYYY'), 'Sem data') AS "Mês de nascimento"
FROM cliente;

--2. O nome do cliente e somente o nome do mês de nascimento (Janeiro, Fevereiro etc). Caso a data de nascimento não esteja preenchida mostrar a mensagem “Não informado”.
SELECT 
	nome,
	CASE EXTRACT (MONTH FROM data_nascimento)
		WHEN '01' THEN 'Janeiro'
		WHEN '02' THEN 'Fevereiro'
		WHEN '03' THEN 'Março'
		WHEN '04' THEN 'Abril'
		WHEN '05' THEN 'Maio'
		WHEN '06' THEN 'Junho'
		WHEN '07' THEN 'Julho'
		WHEN '08' THEN 'Agosto'
		WHEN '09' THEN 'Setembro'
		WHEN '10' THEN 'Outubro'
		WHEN '11' THEN 'Novembro'
		WHEN '12' THEN 'Dezembro'
	ELSE 'Não informado'
	END AS "Mês de nascimento"
FROM cliente;
	
--3. O nome do cliente e somente o ano de nascimento. Caso a data de nascimento não esteja preenchida mostrar a mensagem “Não informado”.
SELECT
	nome,
	COALESCE (EXTRACT(YEAR FROM data_nascimento)::text, 'Não informato') AS "Ano de nascimento"
FROM cliente;

--4. O caractere 5 até o caractere 10 de todos os municípios.
SELECT * FROM municipio;
SELECT
	substring(nome FROM 5 FOR 10) AS "Somente o caracter 5 até 10"
FROM municipio;
	
--5. O nome de todos os municípios em letras maiúsculas.
SELECT
	upper(nome)
FROM municipio;


--6. O nome do cliente e o gênero. Caso seja M mostrar “Masculino”, senão mostrar “Feminino”.
SELECT * FROM cliente;

SELECT
	nome,
	CASE genero
		WHEN 'F' THEN 'Feminino'
		WHEN 'M' THEN 'Masculino'
	ELSE 'Other'
	END AS "Gênero"
FROM cliente;


--7. O nome do produto e o valor. Caso o valor seja maior do que R$ 500,00 mostrar a mensagem “Acima de 500”, caso contrário, mostrar a mensagem “Abaixo de 500”.
SELECT * FROM produto;

SELECT nome, valor FROM produto;

SELECT
	nome,
	valor,
	CASE
		WHEN valor > 500 THEN 'Acima de 500'
	ELSE 'Abaixo de 500'
	END AS "Valor acima ou abaixo de 500"
FROM produto;
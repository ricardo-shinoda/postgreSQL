-- TRABALHANDO COM JOINS

-- LEFT OUTER JOIN
-- traz todos os cliente com ou sem profissão

SELECT 
	cln.nome AS cliente,
	prf.nome AS profissao
FROM 
	cliente AS cln
LEFT OUTER JOIN -- Traz todos os valores se há ou não relacionamento.
	profissao AS prf ON cln.idprofissao = prf.idprofissao;

-- INNER JOIN
-- traz somente os clientes que possuem profissao
SELECT 
	cln.nome AS cliente,
	prf.nome AS profissao
FROM 
	cliente AS cln
INNER JOIN -- obriga que exista o relacionamento (valores) entre os dois componentes
	profissao AS prf ON cln.idprofissao = prf.idprofissao;


-- RIGHT OUTER JOIN
-- traz somente as profissões que possuem relacionamento com os cliente.
SELECT 
	cln.nome AS cliente,
	prf.nome AS profissao
FROM 
	cliente AS cln
RIGHT OUTER JOIN -- obriga que exista o relacionamento (valores) entre os dois componentes
	profissao AS prf ON cln.idprofissao = prf.idprofissao;
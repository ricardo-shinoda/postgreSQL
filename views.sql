-- Views
-- Substituir joins

CREATE VIEW cliente_profissao AS
SELECT
	cln.nome AS nome,
	prf.nome AS profissao
FROM cliente cln
LEFT JOIN
	 profissao prf ON cln.idprofissao = prf.idprofissao;

-- Para mostrar a view, fazer como se ela fosse uma tabela:

SELECT * FROM cliente_profissao WHERE Nome = 'Amanda';


-- Para deletear uma view
DROP VIEW cliente_profissao;

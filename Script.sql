-- Procedure

SELECT * FROM neighborhood;

CREATE PROCEDURE insert_neighborhood (nbh_name varchar(30)) LANGUAGE sql AS
$$
	insert into neighborhood(name) values(nbh_name);
$$;

CALL insert_neighborhood('Nova Universitária');

INSERT INTO neighborhood (name) VALUES ('Teste 1');


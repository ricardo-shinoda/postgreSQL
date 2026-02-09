-- procedure

CREATE PROCEDURE neighborhood_insert (nbh_name varchar(30)) LANGUAGE SQL AS
$$
	INSERT INTO neighborhood (name) values (nbh_name);
$$;

CALL neighborhood_insert ('Altos da Cidade');

SELECT * FROM neighborhood;
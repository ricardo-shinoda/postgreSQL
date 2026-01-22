-- Views
-- Replace joins

CREATE VIEW customer_profession AS
SELECT
    c.full_name AS customer_name,
    p.name AS profession
FROM customer c
LEFT JOIN
     profession p ON c.profession_id = p.profession_id;

-- To show the view, use it as if it were a table:

SELECT * FROM customer_profession WHERE customer_name = 'Amanda';

-- To delete a view
DROP VIEW customer_profession;
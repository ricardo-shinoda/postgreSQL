-- WORKING WITH JOINS

-- LEFT OUTER JOIN
-- brings all customers with or without profession

SELECT 
    c.full_name AS customer,
    p.name AS profession
FROM 
    customer AS c
LEFT OUTER JOIN -- Brings all values whether there is a relationship or not.
    profession AS p ON c.profession_id = p.profession_id;

-- INNER JOIN
-- brings only customers who have a profession
SELECT 
    c.full_name AS customer,
    p.name AS profession
FROM 
    customer AS c
INNER JOIN -- Requires that there is a relationship (values) between the two components
    profession AS p ON c.profession_id = p.profession_id;

-- RIGHT OUTER JOIN
-- brings only professions that have a relationship with customers.
SELECT 
    c.full_name AS customer,
    p.name AS profession
FROM 
    customer AS c
RIGHT OUTER JOIN -- Requires that there is a relationship (values) between the two components
    profession AS p ON c.profession_id = p.profession_id;
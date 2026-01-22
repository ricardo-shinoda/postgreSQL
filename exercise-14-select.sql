--1. Name, gender, and profession of all customers, ordered by name in descending order
SELECT
    full_name,
    gender,
    profession_id
FROM customer
ORDER BY full_name DESC;

--2. Customers who have the letter "R" in their name
SELECT 
    *
FROM customer c 
WHERE full_name LIKE '%r%';

--3. Customers whose name starts with the letter "C"
SELECT 
    *
FROM customer c 
WHERE full_name LIKE 'C%';

--4. Customers whose name ends with the letter "A"
SELECT 
    *
FROM customer c 
WHERE full_name LIKE '%a';

--5. Customers who live in the neighborhood "Centro"
SELECT
    *
FROM customer c 
WHERE neighborhood_id IN (SELECT neighborhood_id FROM neighborhood WHERE name = 'Centro');

--6. Customers who live in address complements that start with the letter "A"
SELECT
    *
FROM customer c
WHERE complement_id IN (SELECT complement_id FROM address_complement WHERE name LIKE 'A%');

--7. Only female customers
SELECT
    *
FROM customer
WHERE gender = 'F';

--8. Customers who did not provide CPF
SELECT
    *
FROM customer c
WHERE cpf IS NULL;

--9. Name and profession of customers, ordered in ascending order by profession name
SELECT
    c.full_name,
    p.name AS profession
FROM customer c
LEFT JOIN profession p ON c.profession_id = p.profession_id
ORDER BY p.name ASC;

--10. Customers with "Brazilian" nationality
SELECT 
    c.*,
    n.name AS nationality
FROM customer c
LEFT JOIN nationality n ON c.nationality_id = n.nationality_id
WHERE n.name = 'Brazilian';

--11. Customers who provided the house number
SELECT 
    *
FROM customer
WHERE address_number IS NOT NULL;

--12. Customers who live in Santa Catarina state
SELECT
    c.*,
    s.name AS state
FROM customer c
LEFT JOIN state s ON c.state_id = s.state_id
WHERE s.name = 'Santa Catarina';

--13. Customers born between 01/01/2000 and 01/01/2002
SELECT
    *
FROM customer
WHERE birth_date BETWEEN '2000-01-01' AND '2002-01-02';

--14. Customer name and the concatenated street address, number, complement, neighborhood, city and state of all customers
SELECT 
    'Name: ' || full_name ||
    ' Address: ' || COALESCE(street_address, '') ||
    ' Number: ' || COALESCE(address_number, '') ||
    ' Complement: ' || COALESCE((SELECT name FROM address_complement WHERE complement_id = c.complement_id), '') ||
    ' Neighborhood: ' || COALESCE((SELECT name FROM neighborhood WHERE neighborhood_id = c.neighborhood_id), '') ||
    ' City: ' || COALESCE((SELECT name FROM city WHERE city_id = c.city_id), '') ||
    ' State: ' || COALESCE((SELECT name FROM state WHERE state_id = c.state_id), '') AS "Full Address"
FROM customer c;

-- Alternative version with JOINs for exercise 14:
SELECT 
    'Name: ' || c.full_name ||
    ' Address: ' || COALESCE(c.street_address, '') ||
    ' Number: ' || COALESCE(c.address_number, '') ||
    ' Complement: ' || COALESCE(ac.name, '') ||
    ' Neighborhood: ' || COALESCE(nb.name, '') ||
    ' City: ' || COALESCE(ct.name, '') ||
    ' State: ' || COALESCE(s.name, '') AS "Full Address"
FROM customer c
LEFT JOIN address_complement ac ON c.complement_id = ac.complement_id
LEFT JOIN neighborhood nb ON c.neighborhood_id = nb.neighborhood_id
LEFT JOIN city ct ON c.city_id = ct.city_id
LEFT JOIN state s ON c.state_id = s.state_id;
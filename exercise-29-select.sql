--1. Only the name of all salespeople in alphabetical order.
SELECT name FROM salesperson ORDER BY name ASC;

--2. Products with price greater than R$200.00, in ascending order by price.
SELECT * FROM product WHERE price > 200 ORDER BY price ASC;

--3. Product name, price, and price adjusted by 10%, ordered by product name.
SELECT name, price, price + price * 0.10 AS "Price adjusted by 10%" FROM product ORDER BY name;

--4. Cities in Rio Grande do Sul state.
SELECT * FROM city WHERE state_id = 5;

--5. Orders made between 04/10/2008 and 04/25/2008 ordered by value.
SELECT * FROM orders WHERE order_date BETWEEN '2008-04-10' AND '2008-04-25' ORDER BY total_value;

--6. Orders where the value is between R$1,000.00 and R$1,500.00.
SELECT * FROM orders WHERE total_value BETWEEN 1000 AND 1500;

--7. Orders where the value is not between R$100.00 and R$500.00.
SELECT * FROM orders WHERE total_value NOT BETWEEN 100 AND 500;

--8. Orders by salesperson Andre ordered by value in descending order.
SELECT * FROM orders WHERE salesperson_id = 1 ORDER BY total_value DESC;

--9. Orders by customer Manoel ordered by value in ascending order.
SELECT * FROM orders WHERE customer_id = 1 ORDER BY total_value ASC;

--10. Orders by customer Jessica (15) that were made by salesperson Andre (1).
SELECT * FROM orders WHERE customer_id = 15 AND salesperson_id = 1;

--11. Orders that were shipped by shipping company União Transportes (2).
SELECT * FROM orders WHERE shipping_company_id = 2;

--12. Orders made by salesperson Maria (5) or salesperson Aline (7).
SELECT * FROM orders WHERE salesperson_id = 5 OR salesperson_id = 7;

--13. Customers who live in União da Vitória or Porto União.
SELECT c.* FROM customer c 
INNER JOIN city ct ON c.city_id = ct.city_id 
WHERE ct.name IN ('União da Vitória', 'Porto União');

--14. Customers who do not live in União da Vitória (city_id = 4) or Porto União (city_id = 5).
SELECT c.* FROM customer c WHERE c.city_id NOT IN (4, 5);

--15. Customers who did not provide street address.
SELECT * FROM customer WHERE street_address IS NULL;

--16. Customers who live on avenues.
SELECT * FROM customer WHERE street_address LIKE 'Av.%';

--17. Salespeople whose name starts with the letter S.
SELECT * FROM salesperson WHERE name LIKE 'S%';

--18. Salespeople whose name ends with the letter A.
SELECT * FROM salesperson WHERE name LIKE '%a';

--19. Salespeople whose name does not start with the letter A.
SELECT * FROM salesperson WHERE name NOT LIKE 'A%';

--20. Cities that start with the letter P and are in Santa Catarina state (state_id = 3).
SELECT * FROM city WHERE name LIKE 'P%' AND state_id = 3;

--21. Shipping companies that provided address information.
SELECT * FROM shipping_company WHERE street_address IS NOT NULL;

--22. Items from order 01.
SELECT * FROM order_product WHERE order_id = 1;

--23. Items from order 06 or order 10.
SELECT * FROM order_product WHERE order_id = 6 OR order_id = 10;
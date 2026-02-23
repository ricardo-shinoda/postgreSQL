--Exercise Set 1: Basic Window Functions (RANK, DENSE_RANK, ROW_NUMBER)
--Exercise 1.1:
--Write a query to rank employees by salary within each department. Include emp_name, department, salary, and their rank (highest salary gets rank 1).
SELECT * FROM employees;

SELECT
	emp_name,
	department,
	salary,
	ROW_NUMBER() OVER (
		PARTITION BY department
		ORDER BY salary desc
	) AS ranking
FROM employees;

--Exercise 1.2:
--For each employee, show their salary along with the average salary of their department.
SELECT
	emp_name,
	department,
	salary,
	ROW_NUMBER() OVER (
		PARTITION BY department
		ORDER BY salary desc
	) AS ranking,
	round(AVG(salary) OVER (PARTITION BY department), 2) AS avg_salary
FROM employees;


--Exercise 1.3:
--Find the top 3 highest-paid employees in each department.

SELECT * FROM 
(SELECT
	emp_name,
	department,
	salary,
	ROW_NUMBER() OVER (
		PARTITION BY department
		ORDER BY salary DESC
	) AS ranking
FROM employees) rk
WHERE rk.ranking <= 3;

--Exercise Set 2: Running Totals and Moving Averages
--Exercise 2.1:
--Calculate a running total of sales for each employee, ordered by sale_date.
SELECT 
	sum(amount) AS soma,
	emp.emp_name AS name,
	sale_date,
	SUM(amount) OVER (
		PARTITION BY sales.emp_id
		ORDER BY sale_date ASC
	) AS somatorio
FROM sales
LEFT JOIN employees AS emp ON emp.emp_id = sales.emp_id
GROUP BY emp.emp_name, sale_date, sales.amount, sales.emp_id;

--Exercise 2.2:
--Calculate a 3-day moving average of sales amount for each employee.
--
--Exercise Set 3: LAG and LEAD Functions
--Exercise 3.1:
--For each employee, show their current salary and the salary of the person hired just before them in the same department.
--
--Exercise 3.2:
--Calculate the month-over-month sales growth for each employee (difference between current month's sales and previous month's sales).
--
--Exercise Set 4: Complex Scenarios
--Exercise 4.1:
--Find employees who earn more than the average salary of their department, but less than the average salary of the company.
--
--Exercise 4.2:
--Calculate the percentage of total company sales each employee contributes, by month.
--
--Exercise 4.3:
--Identify the first and last sale for each employee in each product category.
--
--Exercise Set 5: Advanced Challenges
--Exercise 5.1:
--Find the salary quartiles for each department.
--
--Exercise 5.2:
--For each employee, calculate the difference between their salary and the salary of the next highest-paid person in their department.
--
--Exercise 5.3:
--Identify employees whose salary increased by more than 10% from their first year to their current year (assuming you have historical salary data).

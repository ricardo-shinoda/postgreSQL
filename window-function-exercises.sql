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

--Exercise Set 1: Basic Window Functions (RANK, DENSE_RANK, ROW_NUMBER)
--Exercise 1.1:
--Write a query to rank employees by salary within each department. Include emp_name, department, salary, and their rank (highest salary gets rank 1).
SELECT * FROM employees;

SELECT
	emp_name,
	department,
	salary,
	RANK() OVER (
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


SELECT 
	emp.emp_name,
	sales.sale_date,
	sales.amount,
	sum(sales.amount) OVER(
		PARTITION BY sales.emp_id
		ORDER BY sale_date
		ROWS UNBOUNDED PRECEDING 
	) AS running_totals
FROM sales
JOIN employees emp ON emp.emp_id = sales.emp_id;

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
SELECT * FROM
(SELECT 
	avg(amount) AS sales,
	emp.emp_name AS name,
	sales.sale_date,
	round(AVG(amount) OVER (
		PARTITION BY sales.emp_id
	), 2) AS average,
	ROW_NUMBER () OVER (
		PARTITION BY emp.emp_name
		ORDER BY sale_date ASC
	) AS ranking
FROM sales
LEFT JOIN employees emp ON emp.emp_id = sales.emp_id
GROUP BY emp.emp_id, sales.emp_id, sales.amount, sales.sale_date) AS rk
WHERE rk.ranking <= 3;

-- corrected version
SELECT
	emp_name,
	sale_date,
	amount,
	round(AVG(amount) OVER (
		PARTITION BY emp.emp_id
		ORDER BY sale_date
		ROWS BETWEEN 2 PRECEDING AND CURRENT ROW 
	), 2) AS moving_avg_3day
FROM sales
JOIN employees emp ON emp.emp_id = sales.emp_id
ORDER BY emp.emp_id, sales.sale_date;


-- The same example of 3 day moving forward of sales amount do looking 1 day behind and 1 day ahead
SELECT 
	emp.emp_name AS employee,
	sale_date,
	amount,
	round(avg(amount) OVER (
		PARTITION BY emp_name
		ORDER BY sale_date
		ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING
	), 2) AS centered_sales_average
FROM sales
LEFT JOIN employees emp ON emp.emp_id = sales.emp_id;

--Exercise Set 3: LAG and LEAD Functions
--Exercise 3.1:
--For each employee, show their current salary and the salary of the person hired just before them in the same department.
SELECT
	emp_name,
	hire_date,
	department,
	salary AS current_salary,
	LAG(salary, 1) OVER (
		PARTITION BY department
	) AS previous_hired_person
FROM employees;

--Exercise 3.2:
--Calculate the month-over-month sales growth for each employee (difference between current month's sales and previous month's sales).
SELECT
	emp.emp_name AS employee,
	sales.sale_date,
	sum(sales.amount) AS current_sales,
	LAG(amount, 1) OVER (
		PARTITION BY sales.emp_id
		ORDER by sale_date
	) AS previous_month_sales
FROM sales
LEFT JOIN employees emp ON emp.emp_id = sales.emp_id
GROUP BY emp.emp_name, sales.amount, sales.emp_id, sales.sale_date;

--Exercise Set 4: Complex Scenarios
--Exercise 4.1:
--Find employees who earn more than the average salary of their department, but less than the average salary of the company.
WITH average_data AS (
	SELECT
		emp_name AS employee,
		salary,
		round(AVG(salary) OVER (
				PARTITION BY department
			), 2) AS average_department,
		round(AVG(salary) OVER(), 2) AS avg_total
FROM employees
)
SELECT * FROM average_data
WHERE salary > average_department AND salary < avg_total;

--Exercise 4.2:
--Calculate the percentage of total company sales each employee contributes, by month.
SELECT 
  emp_id,
  TO_CHAR(sale_date, 'YYYY-MM') AS month,
  SUM(amount) AS employee_monthly_total,
  SUM(SUM(amount)) OVER (PARTITION BY TO_CHAR(sale_date, 'YYYY-MM')) AS company_monthly_total,
  ROUND((SUM(amount) / SUM(SUM(amount)) OVER (PARTITION BY TO_CHAR(sale_date, 'YYYY-MM'))) * 100, 2) AS percentage_contribution
FROM sales
GROUP BY emp_id, TO_CHAR(sale_date, 'YYYY-MM')
ORDER BY month, emp_id ASC;

-- An alternative solution:
WITH monthly_employee_sales AS (
    SELECT 
        emp_id,
        DATE_TRUNC('month', sale_date) AS month,
        SUM(amount) AS employee_monthly_total
    FROM sales
    GROUP BY emp_id, DATE_TRUNC('month', sale_date)
)
SELECT 
    emp_id,
    TO_CHAR(month, 'YYYY-MM') AS month,
    employee_monthly_total,
    SUM(employee_monthly_total) OVER (PARTITION BY month) AS company_monthly_total,
    ROUND(
        (employee_monthly_total / SUM(employee_monthly_total) OVER (PARTITION BY month)) * 100, 
        2
    ) AS percentage_contribution
FROM monthly_employee_sales
ORDER BY month, emp_id;

--Exercise 4.3:
--Identify the first and last sale for each employee in each product category.

WITH ranked_sales AS (
	SELECT 
		sale_id,
		emp_id,
		sale_date,
		amount,
		product_category,
		ROW_NUMBER() OVER (
			PARTITION BY emp_id, product_category
			ORDER BY sale_date ASC
		) AS rn_first,
		ROW_NUMBER() OVER (
			PARTITION BY emp_id, product_category
			ORDER BY sale_date DESC
		) AS rn_last
	FROM sales
)
SELECT
	emp_id,
	product_category,
	max(CASE WHEN rn_first = 1 THEN sale_id END) AS first_sale_id,
	max(CASE WHEN rn_first = 1 THEN sale_date END) AS first_sale_date,
	max(CASE WHEN rn_first = 1 THEN amount END) AS first_sale_amount,
	max(CASE WHEN rn_last = 1 THEN sale_id END) AS last_sale_id,
	max(CASE WHEN rn_last = 1 THEN sale_date END) AS last_sale_date,
	max(CASE WHEN rn_last = 1 THEN amount END) AS last_amount
FROM ranked_sales
GROUP BY emp_id, product_category
ORDER BY emp_id, product_category;

-- An alternative solution

SELECT * FROM sales;

WITH first_last_value AS (
SELECT 
	emp_id,
	amount,
	product_category,
	FIRST_VALUE(amount) OVER (
		PARTITION BY emp_id, product_category
		ORDER BY product_category
		ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
	) AS first_sale,
	LAST_VALUE(amount) OVER (
		PARTITION BY emp_id, product_category 
		ORDER BY product_category
		ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
	) AS last_sale
FROM sales
)
SELECT
	emp_id,
	product_category,
	max(first_sale) AS first_sale,
	max(last_sale) AS last_sale
FROM first_last_value
GROUP BY emp_id, product_category
ORDER BY emp_id, product_category;


--Exercise Set 5: Advanced Challenges
--Exercise 5.1:
--Find the salary quartiles for each department.
-- Q2 = Median value
-- Q1 = Median from first half
-- Q3 = Median from second half

SELECT
	emp_name AS name,
	department,
	salary,
	NTILE(4) OVER (
		PARTITION BY department
		ORDER BY salary
) AS salary_quartile
FROM employees;
	
SELECT DISTINCT 
	department,
	PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY salary) AS Q1,
	PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY salary) AS Q2,
	PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY salary) AS Q3
FROM employees
GROUP BY department;


SELECT * FROM employees;

SELECT
	emp_name,
	department,
	salary,
	NTILE(4) OVER (
--		PARTITION BY department
		ORDER BY salary
) AS quartile
FROM employees;

--Exercise 5.2:
--For each employee, calculate the difference between their salary and the salary of the next highest-paid person in their department.
WITH next_highest AS (
	SELECT 
		emp_name, 
		department, 
		salary,
		LEAD(salary, 1) OVER (
			PARTITION BY department
			ORDER BY salary
		) AS next_salary
	FROM employees
)
SELECT
	emp_name,
	salary,
	next_salary,
	COALESCE((salary - next_salary)::TEXT, ' Highest') AS salary_difference
FROM next_highest;

--Exercise 5.3:
--Identify employees whose salary increased by more than 10% from their first year to their current year (assuming you have historical salary data).

ALTER TABLE employees
ADD COLUMN salary_2025 decimal(10,2);

UPDATE employees
SET salary_2025 = 
	CASE
		WHEN emp_id IN (1, 3, 8, 13) THEN salary * 0.8
		WHEN emp_id IN (5, 9, 12) THEN salary * 0.75
		WHEN department = 'IT' THEN salary * 0.95
		WHEN department = 'Sales' THEN salary * 0.91
		ELSE salary * 0.90
	END;
	

WITH higher_increase AS (
SELECT
	emp_name,
	department,
	salary_2025,
	salary,
	round(100 - (salary_2025 / salary) * 100, 2) AS percentual
FROM employees
)
SELECT * FROM higher_increase
WHERE percentual >= 10
ORDER BY percentual ASC;

SELECT * FROM sales;

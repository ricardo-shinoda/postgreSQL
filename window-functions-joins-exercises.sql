-- Window Function and Join Exercise

--SECTION 1: WINDOW FUNCTIONS - RANKING
--Exercise 1.1: Employee Ranking by Salary
--Rank employees by salary within each department.
--Expected columns: emp_name, department, salary, rank_in_dept

SELECT
	emp_name,
	department,
	salary,
	RANK() over (
		PARTITION BY department
		ORDER BY salary DESC
	) AS rank_in_dept
FROM employees;

--Exercise 1.2: Top 2 Employees per Department
--Find the top 2 highest-paid employees in each department.
--Show only employees ranked 1 or 2 in their department by salary

WITH top_two AS (
	SELECT
		emp_name,
		department,
		salary,
		RANK () OVER (
			PARTITION BY department
			ORDER BY salary DESC
		) AS rank_in_dept
	FROM employees
)
SELECT * FROM top_two
WHERE rank_in_dept <= 2;

--Exercise 1.3: Product Category Sales Ranking
--For each employee, rank their sales by product category (which category do they sell most in?).
--Show each employee's sales per category with rank

WITH highest_sales_category AS (
SELECT
	emp.emp_name AS employee,
	sales.amount,
	sales.product_category,
	RANK () OVER ( 
		PARTITION BY emp.emp_id
		ORDER BY amount DESC
	) AS rank
FROM sales
LEFT JOIN employees emp ON emp.emp_id = sales.emp_id
)
SELECT * FROM highest_sales_category 
WHERE RANK = 1
ORDER BY amount DESC;

--SECTION 2: WINDOW FUNCTIONS - RUNNING TOTALS & MOVING CALCULATIONS
--Exercise 2.1: Cumulative Sales by Employee
--Show each sale with running total of sales for that employee.
--For each sale, show: sale_date, amount, employee's running total

SELECT
	emp.emp_name AS employee,
	sales.sale_date,
	sales.amount,
	SUM(sales.amount) OVER (
		PARTITION BY sales.emp_id
		ORDER BY sales.sale_date
	) AS employee_running_total
FROM sales
LEFT JOIN employees emp ON emp.emp_id = sales.emp_id;


--Exercise 2.2: Monthly Company Sales with Running Total
--Calculate monthly sales for the company and add a running total.
--Columns: month, monthly_total, company_running_total

WITH running AS (
SELECT 
	date_trunc('month', sale_date)::date AS month,
	sum(sales.amount) AS monthly_total
--	sum(sales.amount) OVER (ORDER BY sale_date) AS company_running_total
FROM sales
GROUP BY date_trunc('month', sale_date)
)
SELECT
	month,
	monthly_total,
	sum(monthly_total) OVER (ORDER BY month) AS company_running_totals
FROM running
ORDER BY MONTH;

	



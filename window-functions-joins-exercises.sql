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
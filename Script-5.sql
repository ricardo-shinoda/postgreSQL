CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE,
    manager_id INT
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    emp_id INT,
    sale_date DATE,
    amount DECIMAL(10,2),
    product_category VARCHAR(50)
);

INSERT INTO employees (emp_id, emp_name, department, salary, hire_date, manager_id) VALUES
(1, 'John Smith', 'IT', 85000, '2020-01-15', NULL),
(2, 'Sarah Johnson', 'IT', 75000, '2020-03-20', 1),
(3, 'Mike Williams', 'IT', 82000, '2019-11-10', 1),
(4, 'Emily Brown', 'IT', 72000, '2021-02-01', 2),
(5, 'David Lee', 'Sales', 65000, '2020-06-15', 8),
(6, 'Lisa Anderson', 'Sales', 78000, '2019-08-22', 8),
(7, 'Tom Wilson', 'Sales', 71000, '2021-01-10', 6),
(8, 'Jane Davis', 'Sales', 92000, '2018-05-12', NULL),
(9, 'Robert Taylor', 'HR', 58000, '2021-03-01', 10),
(10, 'Maria Garcia', 'HR', 62000, '2020-09-14', NULL),
(11, 'James Martin', 'HR', 55000, '2022-01-20', 10),
(12, 'Patricia White', 'Marketing', 67000, '2020-11-01', 13),
(13, 'Michael Clark', 'Marketing', 81000, '2019-04-18', NULL),
(14, 'Jennifer Hall', 'Marketing', 63000, '2021-07-01', 13),
(15, 'Charles Lewis', 'Marketing', 59000, '2022-02-15', 12);

INSERT INTO sales (sale_id, emp_id, sale_date, amount, product_category) VALUES
(1, 5, '2023-01-05', 1200.00, 'Electronics'),
(2, 5, '2023-01-15', 850.00, 'Office Supplies'),
(3, 5, '2023-02-01', 2100.00, 'Electronics'),
(4, 5, '2023-02-10', 950.00, 'Furniture'),
(5, 5, '2023-03-05', 1750.00, 'Electronics'),
(6, 6, '2023-01-08', 3200.00, 'Furniture'),
(7, 6, '2023-01-22', 1450.00, 'Electronics'),
(8, 6, '2023-02-12', 2800.00, 'Furniture'),
(9, 6, '2023-02-28', 1900.00, 'Office Supplies'),
(10, 6, '2023-03-15', 4100.00, 'Electronics'),
(11, 7, '2023-01-12', 950.00, 'Office Supplies'),
(12, 7, '2023-01-25', 1350.00, 'Electronics'),
(13, 7, '2023-02-05', 800.00, 'Office Supplies'),
(14, 7, '2023-02-18', 1650.00, 'Furniture'),
(15, 7, '2023-03-10', 1100.00, 'Electronics'),
(16, 8, '2023-01-03', 5200.00, 'Furniture'),
(17, 8, '2023-01-20', 3800.00, 'Electronics'),
(18, 8, '2023-02-08', 4300.00, 'Furniture'),
(19, 8, '2023-02-22', 2900.00, 'Electronics'),
(20, 8, '2023-03-12', 6100.00, 'Furniture'),
(21, 2, '2023-01-18', 450.00, 'Software'),
(22, 2, '2023-02-14', 600.00, 'Software'),
(23, 2, '2023-03-08', 350.00, 'Software'),
(24, 3, '2023-01-30', 1200.00, 'Hardware'),
(25, 3, '2023-02-25', 800.00, 'Hardware'),
(26, 3, '2023-03-20', 1500.00, 'Hardware');

INSERT INTO sales (sale_id, emp_id, sale_date, amount, product_category) VALUES
(27, 5, '2022-12-05', 1100.00, 'Electronics'),
(28, 5, '2022-11-10', 950.00, 'Office Supplies'),
(29, 6, '2022-12-15', 2900.00, 'Furniture'),
(30, 6, '2022-11-20', 2100.00, 'Electronics'),
(31, 7, '2022-12-08', 850.00, 'Office Supplies'),
(32, 7, '2022-11-12', 1200.00, 'Electronics'),
(33, 8, '2022-12-18', 4800.00, 'Furniture'),
(34, 8, '2022-11-22', 3500.00, 'Electronics');


SELECT * FROM sales;
SELECT * FROM employees;
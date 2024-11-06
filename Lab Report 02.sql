CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);


CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);


CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);


CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category_id INT
);

INSERT INTO departments (department_id, department_name)
VALUES
(1, 'Sales'),
(2, 'Account'),
(3, 'IT');


INSERT INTO employees (employee_id, name, department, salary)
VALUES
(1, 'Noor Hossain', 'Sales', 55000),
(2, 'Fakir Shohan', 'Sales', 48000),
(3, 'Tamim Ahmed', 'Sales', 61000),
(4, 'Ibrahim Rafi', 'IT', 58000),
(5, 'Selim Reza', 'Account', 45000),
(6, 'Jahid Hasan', 'IT', 75000),
(7, 'Zahangir Alam', 'Sales', 62000),
(8, 'Mujammel Haque', 'Account', 70000),
(9, 'Ikbal Hossen', 'IT', 65000),
(10, 'Moshiur Rahman', 'Account', 52000),
(11, 'Ajmaot Ullah', 'Sales', 54000);


INSERT INTO customers (customer_id, customer_name)
VALUES
(1, 'Ahsan Ullah'),
(2, 'Bilal Hossain'),
(3, 'Ashraf Khan'),
(4, 'Chowdhury Kamal'),
(5, 'Arif Rahman'),
(6, 'Amina Begum'),
(7, 'Mahbub Alam'),
(8, 'Alim Uddin'),
(9, 'Anowar Hossain'),
(10, 'Rahman Sheikh'),
(11, 'Sakib Khan');


INSERT INTO products (product_id, product_name, category_id)
VALUES
(1, 'Laptop', 1),
(2, 'Mobile Phone', 2),
(3, 'Tablet', 3),
(4, 'Monitor', 2),
(5, 'Keyboard', 4),
(6, 'Mouse', 4),
(7, 'Printer', 5),
(8, 'Router', 5),
(9, 'Speaker', 6),
(10, 'Headphone', 6),
(11, 'Smartwatch', 7);

-- Task 1: 

SELECT * FROM employees
WHERE salary > 50000;

-- Task 2:

SELECT * FROM employees WHERE name LIKE 'A%';

SELECT * FROM employees WHERE name LIKE '%A%';

SELECT * FROM employees WHERE name LIKE '%A';

-- Task 3: 

SELECT department, AVG(salary) AS average_salary FROM employees GROUP BY department;


-- Task 4: 

SELECT department, AVG(salary) AS average_salary FROM employees GROUP BY department HAVING AVG(salary) > 60000;


-- Task 5: 

SELECT * FROM products WHERE category_id IN (1, 2, 3);


-- Task 6:

SELECT * FROM products WHERE category_id NOT IN (1, 2, 3);


-- Task 7: 

SELECT * FROM employees
WHERE department IN ( SELECT department FROM employees GROUP BY department HAVING COUNT(*) > 3);

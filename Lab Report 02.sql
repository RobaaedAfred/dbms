-- Robaaed Afred Tanik


CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);


CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10, 2),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
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

INSERT INTO employees (employee_id, name, department_id, salary)
VALUES
(1, 'Noor Hossain', 1, 55000),
(2, 'Tamim Rahman', 2, 48000),
(3, 'Fakir Shohan', 1, 61000),
(4, 'Ibrahim Rafi', 3, 58000),
(5, 'Shoyeb Ahmed ', 2, 45000),
(6, 'Jahid Hasan', 3, 75000),
(7, 'Zahangir Alam', 1, 62000),
(8, 'Ajmot Ullah', 2, 70000),
(9, 'Ripon Sarker', 3, 65000),
(10, 'Rokib Sarker', 2, 52000),
(11, 'Ikbal Hossen', 1, 54000);


INSERT INTO customers (customer_id, customer_name)
VALUES
(1, 'Ahsan Ullah'),
(2, 'Bilal Hossain'),
(3, 'Ashraf Khan'),
(4, 'Chowdhury Kamal'),
(5, 'Arif Rehman'),
(6, 'Amina Begum'),
(7, 'Mahbub Alam'),
(8, 'Alim Uddin Buddin'),
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

SELECT * FROM employees WHERE salary > 50000;

-- Task 2: 

SELECT * FROM customers WHERE customer_name LIKE 'A%';

SELECT * FROM customers WHERE customer_name LIKE '%A%';

SELECT * FROM customers WHERE customer_name LIKE '%A';

-- Task 3: 

SELECT d.department_name, AVG(e.salary) AS average_salary FROM employees e JOIN departments d ON e.department_id = d.department_id GROUP BY d.department_name;

-- Task 4: 

SELECT d.department_name, AVG(e.salary) AS average_salary FROM employees e JOIN departments d ON e.department_id = d.department_id GROUP BY d.department_name HAVING AVG(e.salary) > 60000;

-- Task 5:

SELECT * FROM products WHERE category_id IN (1, 2, 3);

-- Task 6: 

SELECT * FROM products WHERE category_id NOT IN (1, 2, 3);

-- Task 7:

SELECT * FROM employees
WHERE department_id IN ( SELECT department_id FROM employees GROUP BY department_id HAVING COUNT(*) > 3
);

--Robaaed Afred Tanik
--Id __2213081048

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10, 2),
    city VARCHAR(50)
);


CREATE TABLE departments (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);
-- Insert data into departments table
INSERT INTO departments (id, name) VALUES
(1, 'Engineering'),
(2, 'Marketing'),
(3, 'HR'),
(4, 'Finance');

-- Insert data into employees table
INSERT INTO employees (id, name, department_id, salary, city) VALUES
(1, 'Akash Hossain', 1, 55000, 'Dhaka'),
(2, 'Amina Begum', 2, 45000, 'Chittagong'),
(3, 'Rafiq Uddin', 1, 70000, 'Dhaka'),
(4, 'Tahmina Islam', 3, 48000, 'Rajshahi'),
(5, 'Habib Rahman', 2, 51000, 'Sylhet'),
(6, 'Bashir Alam', 4, 62000, 'Khulna'),
(7, 'Farida Khan', 1, 47000, 'Dhaka'),
(8, 'Kamrul Hasan', 4, 59000, 'Chittagong'),
(9, 'Anika Sultana', 3, 52000, 'Dhaka'),
(10, 'Mahmudul Islam', 1, 68000, 'Dhaka');

--Task1


SELECT * FROM employees
WHERE salary > 50000;

--Task_2
SELECT * FROM employees
WHERE name LIKE 'A%';


--Task_3
SELECT department_id, AVG(salary) AS average_salary FROM employees GROUP BY department_id;

--Task_4
SELECT department_id, AVG(salary) AS average_salary FROM employees GROUP BY department_id HAVING AVG(salary) > 60000;
--Task_5
SELECT * FROM employees WHERE id IN (1, 2, 3);



--Task_6
SELECT * FROM employees WHERE department_id NOT IN (1, 2, 3);


--Task_7
SELECT * FROM employees WHERE department_id IN ( SELECT department_id FROM employees GROUP BY department_id HAVING COUNT(*) > 10
);



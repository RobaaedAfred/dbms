
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department_id INT
);


CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);


CREATE TABLE performance_reviews (
    review_id INT PRIMARY KEY,
    employee_id INT,
    review_date DATE,
    sales_performance INT,
    customer_feedback INT,
    project_completion INT,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO departments (department_id, department_name)
VALUES
(1, 'Sales'),
(2, 'Customer Support'),
(3, 'Development');


INSERT INTO employees (employee_id, employee_name, department_id)
VALUES
(1, 'Noor Hossain', 1),
(2, 'Tamim Rahman', 2),
(3, 'B.G Siyam', 3),
(4, 'Ali Ibne Masud', 1);


INSERT INTO performance_reviews (review_id, employee_id, review_date, sales_performance, customer_feedback, project_completion)
VALUES
(1, 1, '2024-01-15', 85, 90, 75),
(2, 2, '2024-02-10', 70, 95, 80),
(3, 3, '2024-01-25', 60, 88, 85),
(4, 4, '2024-03-05', 90, 80, 88),
(5, 1, '2024-06-15', 87, 92, 76),
(6, 2, '2024-07-20', 78, 91, 82),
(7, 3, '2024-08-25', 65, 85, 90),
(8, 4, '2024-09-15', 93, 88, 90);
-- Question 01
SELECT COUNT(*) AS total_reviews FROM performance_reviews;


-- Question 02
SELECT AVG(sales_performance) AS avg_sales_performance FROM performance_reviews;


-- Question 03
SELECT MAX(customer_feedback) AS highest_feedback FROM performance_reviews;


-- Question 04
SELECT d.department_name, SUM(p.project_completion) AS total_project_completion
FROM performance_reviews p
JOIN employees e ON p.employee_id = e.employee_id
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name;

-- Question 05
SELECT d.department_name,
       AVG(p.sales_performance) AS avg_sales_performance,
       AVG(p.customer_feedback) AS avg_customer_feedback,
       AVG(p.project_completion) AS avg_project_completion
FROM performance_reviews p
JOIN employees e ON p.employee_id = e.employee_id
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name;

-- Question 06
SELECT d.department_name
FROM performance_reviews p
JOIN employees e ON p.employee_id = e.employee_id
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name
HAVING AVG(p.sales_performance) > 80;

-- Question 07
SELECT COUNT(DISTINCT review_date) AS distinct_review_dates
FROM performance_reviews;

-- Question 08
SELECT e.employee_name, COUNT(p.review_id) AS total_reviews
FROM performance_reviews p
JOIN employees e ON p.employee_id = e.employee_id
GROUP BY e.employee_name;

-- Question 09
SELECT d.department_name,
       AVG(p.sales_performance) AS avg_sales_performance,
       COUNT(p.review_id) AS total_reviews
FROM performance_reviews p
JOIN employees e ON p.employee_id = e.employee_id
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name;






-- Robaaed Afred Tanik
-- ID : 2213081048

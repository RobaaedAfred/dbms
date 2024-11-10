--Robaaed Afred Tanik
--ID 2213081048
--Given problem numbr 3.1,   3.2,   3.22,  3.25,  3.26

CREATE TABLE student (
    ID CHAR(5) PRIMARY KEY,
    name VARCHAR(50),
    dept_name VARCHAR(20),
    tot_cred INT
);

INSERT INTO student (ID, name, dept_name, tot_cred) VALUES
('123', 'Noor', 'Comp. Sci.', 45),
('1234', 'Tamim', 'Physics', 55),
('12345', 'Masud', 'History', 65),
('54321', 'Siyam', 'Comp. Sci.', 60),
('4321', 'Bristy', 'Biology', 70),
('321', 'Sami', 'Comp. Sci.', 50);

CREATE TABLE course (
    course_id CHAR(5) PRIMARY KEY,
    title VARCHAR(100),
    dept_name VARCHAR(20),
    credits INT
);

INSERT INTO course (course_id, title, dept_name, credits) VALUES
('C101', 'Data Structures', 'Comp. Sci.', 3),
('C102', 'Algorithms', 'Comp. Sci.', 3),
('C103', 'Database Management Systems', 'Comp. Sci.', 3),
('C104', 'AI', 'Physics', 4),
('C105', 'Computer Graphics', 'Mathematics', 4),
('C106', 'Image Processig', 'Comp. Sci.', 3);

CREATE TABLE instructor (
    ID CHAR(5) PRIMARY KEY,
    name VARCHAR(50),
    dept_name VARCHAR(20),
    salary DECIMAL(10, 2)
);


INSERT INTO instructor (ID, name, dept_name, salary) VALUES
('1', 'Einstein', 'Physics', 120000),
('2', 'Newton', 'Physics', 125000),
('3', 'Turing', 'Comp. Sci.', 115000),
('4', 'Curie', 'Chemistry', 110000),
('5', 'Hawking', 'Physics', 130000),
('6', 'Klein', 'Mathematics', 100000);

CREATE TABLE teaches (
    ID CHAR(5),
    course_id CHAR(5),
    sec_id CHAR(5),
    semester VARCHAR(6),
    year INT,
    PRIMARY KEY (ID, course_id, sec_id, semester, year)
);

INSERT INTO teaches (ID, course_id, sec_id, semester, year) VALUES
('1', 'C104', 'S1', 'Fall', 2017),
('2', 'C105', 'S1', 'Fall', 2017),
('3', 'C101', 'S1', 'Fall', 2017),
('4', 'C106', 'S1', 'Fall', 2017),
('5', 'C102', 'S2', 'Spring', 2018),
('6', 'C105', 'S2', 'Spring', 2018);

CREATE TABLE takes (
    ID CHAR(5),
    course_id CHAR(5),
    sec_id CHAR(5),
    semester VARCHAR(6),
    year INT,
    grade CHAR(2),
    PRIMARY KEY (ID, course_id, sec_id, semester, year)
);

INSERT INTO takes (ID, course_id, sec_id, semester, year, grade) VALUES
('123', 'C101', 'S1', 'Fall', 2017, 'A'),
('1234', 'C102', 'S1', 'Fall', 2017, 'B+'),
('12345', 'C104', 'S1', 'Fall', 2017, 'A-'),
('54321', 'C105', 'S1', 'Fall', 2017, 'B'),
('4321', 'C106', 'S1', 'Fall', 2017, 'A'),
('321', 'C101', 'S1', 'Fall', 2017, 'A-');
CREATE TABLE  (
    course_id CHAR(5),
    sec_id CHAR(5),
    semester VARCHAR(6),
    year INT,
    building VARCHAR(20),
    room_number VARCHAR(10),
    time_slot_id VARCHAR(5),
    PRIMARY KEY (course_id, sec_id, semester, year)
);

INSERT INTO section (course_id, sec_id, semester, year, time_slot_id) VALUES
('C101', 'S1', 'Fall', 2017, 'T1'),
('C102', 'S1', 'Fall', 2017, 'T2'),
('C103', 'S1', 'Spring', 2018, 'T3'),
('C104', 'S1', 'Fall', 2017, 'T4'),
('C105', 'S1', 'Fall', 2017,'T5'),
('C106', 'S1', 'Fall', 2017, 'T6');

CREATE TABLE department (
    dept_name VARCHAR(20) PRIMARY KEY,
    building VARCHAR(20),
    budget DECIMAL(12, 2)
);

INSERT INTO department (dept_name, building, budget) VALUES
('Comp. Sci.', 'Main', 500000),
('Physics', 'West', 400000),
('EEE', 'East', 300000),
('LLB', 'North', 450000),
('Mathematics', 'Main', 350000),
('Philosophy', 'South', 250000);

CREATE TABLE grade_points (
    grade CHAR(2) PRIMARY KEY,
    points FLOAT
);

INSERT INTO grade_points (grade, points) VALUES
('A', 4.0),
('A-', 3.7),
('B+', 3.3),
('B', 3.0),
('B-', 2.7),
('C+', 2.3),
('C', 2.0);
--aa
SELECT title 
FROM course 
WHERE dept_name = 'Comp. Sci.' AND credits = 3;
--bb
SELECT DISTINCT takes.ID 
FROM takes
JOIN teaches ON takes.course_id = teaches.course_id AND takes.sec_id = teaches.sec_id
JOIN instructor ON teaches.ID = instructor.ID
WHERE instructor.name = 'Einstein';
--cc
SELECT MAX(salary) AS highest_salary 
FROM instructor;
--dd

SELECT name 
FROM instructor 
WHERE salary = (SELECT MAX(salary) FROM instructor);
--ee

SELECT course_id, sec_id, COUNT(ID) AS enrollment
FROM takes
WHERE semester = 'Fall' AND year = 2017
GROUP BY course_id, sec_id;
--ff

SELECT MAX(enrollment) AS max_enrollment
FROM (
    SELECT COUNT(ID) AS enrollment
    FROM takes
    WHERE semester = 'Fall' AND year = 2017
    GROUP BY course_id, sec_id
) AS enrollments;
--gg
SELECT course_id, sec_id FROM takes WHERE semester = 'Fall' AND year = 2017 GROUP BY course_id, sec_id
HAVING COUNT(ID) = (SELECT MAX(enrollment_count) FROM (
        SELECT COUNT(ID) AS enrollment_count
        FROM takes
        WHERE semester = 'Fall' AND year = 2017
        GROUP BY course_id, sec_id
    ) AS subquery
);

--Problem No_3.2

--aa
SELECT SUM(course.credits * grade_points.points) AS total_grade_points FROM takes
JOIN course ON takes.course_id = course.course_id
JOIN grade_points ON takes.grade = grade_points.grade
WHERE takes.ID = '12345';

--bb

SELECT SUM(course.credits * grade_points.points) / SUM(course.credits) AS GPA
FROM takes
JOIN course ON takes.course_id = course.course_id
JOIN grade_points ON takes.grade = grade_points.grade
WHERE takes.ID = '12345';

--cc

SELECT takes.ID, 
       SUM(course.credits * grade_points.points) / SUM(course.credits) AS GPA
FROM takes
JOIN course ON takes.course_id = course.course_id
JOIN grade_points ON takes.grade = grade_points.grade
GROUP BY takes.ID;

--dd

SELECT takes.ID, 
       SUM(course.credits * grade_points.points) / NULLIF(SUM(course.credits), 0) AS GPA
FROM takes
JOIN course ON takes.course_id = course.course_id
LEFT JOIN grade_points ON takes.grade = grade_points.grade
WHERE grade_points.points IS NOT NULL
GROUP BY takes.ID;

--Problem 3.22

WHERE (SELECT COUNT(*) FROM Course) = 1

--Problem 3.25

SELECT dept_name
FROM department
WHERE budget > (SELECT budget FROM department WHERE dept_name = 'Philosophy')
ORDER BY dept_name;

--Problem 3.26

SELECT course_id, ID
FROM takes
GROUP BY course_id, ID
HAVING COUNT(*) >= 3
ORDER BY course_id, ID;


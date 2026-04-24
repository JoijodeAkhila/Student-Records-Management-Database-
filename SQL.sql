-- Create Database
CREATE DATABASE student_records;
USE student_records;

-- Students Table
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    join_year INT CHECK (join_year >= 2000)
);

-- Courses Table
CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    credits INT CHECK (credits > 0),
    instructor VARCHAR(100)
);

-- Enrollments Table (Relationship Table - 3NF)
CREATE TABLE enrollments (
    enroll_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    grade CHAR(1),
    
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE,
    
    CHECK (grade IN ('A','B','C','D','F'))
);

-- Index for optimization
CREATE INDEX idx_student_id ON enrollments(student_id);

-- Insert Data
INSERT INTO students (name, email, join_year) VALUES
('Ram Kumar', 'ram@email.com', 2022),
('Priya Singh', 'priya@email.com', 2023),
('Anil Reddy', 'anil@email.com', 2025);

INSERT INTO courses (name, credits, instructor) VALUES
('Database Systems', 3, 'Dr. Rao'),
('Algorithms', 4, 'Prof. Sharma'),
('Operating Systems', 3, 'Ms. Patel');

INSERT INTO enrollments (student_id, course_id, grade) VALUES
(1, 1, 'A'),
(2, 1, 'B'),
(1, 2, 'C'),
(3, 3, 'B');

-- CRUD Operations

-- Read
SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollments;

-- Update
UPDATE students 
SET email = 'ramkumar@email.com' 
WHERE student_id = 1;

-- Delete
DELETE FROM enrollments 
WHERE enroll_id = 4;

-- JOIN Query (Data Retrieval)
SELECT 
    s.name AS student_name, 
    c.name AS course_name, 
    e.grade
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id;

-- Aggregation Query
SELECT 
    c.name AS course_name, 
    COUNT(e.student_id) AS total_students
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id;

-- Filter Query
SELECT 
    s.name AS student_name, 
    c.name AS course_name
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE e.grade = 'A';

-- Advanced Query 
-- Students with highest enrollments
SELECT 
    s.name, 
    COUNT(e.course_id) AS total_courses
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id
ORDER BY total_courses DESC;

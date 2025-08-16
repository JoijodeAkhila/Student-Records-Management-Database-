CREATE DATABASE student_records;
USE student_records;
CREATE TABLE students (
    student_id INTEGER PRIMARY KEY,
    name TEXT,
    email TEXT,
    join_year INTEGER
);

CREATE TABLE courses (
    course_id INTEGER PRIMARY KEY,
    name TEXT,
    credits INTEGER,
    instructor TEXT
);

CREATE TABLE enrollments (
    enroll_id INTEGER PRIMARY KEY,
    student_id INTEGER,
    course_id INTEGER,
    grade TEXT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO students VALUES (1, 'Ram Kumar', 'ram@email.com', 2022);
INSERT INTO students VALUES (2, 'Priya Singh', 'priya@email.com', 2023);
INSERT INTO students VALUES (3, 'Anil Reddy', 'anil@email.com', 2025);

INSERT INTO courses VALUES (101, 'Database Systems', 3, 'Dr. Rao');
INSERT INTO courses VALUES (102, 'Algorithms', 4, 'Prof. Sharma');
INSERT INTO courses VALUES (103, 'Operating Systems', 3, 'Ms. Patel');

INSERT INTO enrollments VALUES (1, 1, 101, 'A');
INSERT INTO enrollments VALUES (2, 2, 101, 'B');
INSERT INTO enrollments VALUES (3, 1, 102, 'C');
INSERT INTO enrollments VALUES (4, 3, 103, 'B');


SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollments;

SELECT s.name, c.name AS course, e.grade
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id;

SELECT c.name AS course, COUNT(e.student_id) AS total_students
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.name;

SELECT s.name, c.name AS course
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE e.grade = 'A';

INSERT INTO students VALUES (4, 'Swetha Rao', 'swetha@email.com', 2024);

UPDATE students SET email = 'ramkumar@email.com' WHERE student_id = 1;

DELETE FROM enrollments WHERE enroll_id = 4;









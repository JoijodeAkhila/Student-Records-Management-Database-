# Student Records Management Database

## Overview
This project implements a MySQL relational database for managing student profiles, courses, and enrollments. It demonstrates schema design, sample data insertion, basic CRUD operations, and analytical queries. The solution serves as a template for portfolio, academic coursework, or real-world adaptation.

## Contents
- `SQL.sql` — Main script to create the database, tables, insert sample data, and run queries.
- `settings.json` — (Optional) VS Code SQLTools connection settings for reference.
- `README.md` — Project documentation and instructions.

## Getting Started

### Prerequisites
- MySQL Server (any version)
- MySQL Workbench or compatible SQL client
- (Optional) VS Code with SQLTools extension

### Running the Project
1. Open MySQL Workbench and connect to your MySQL server (localhost or as configured).
2. Open a new SQL editor tab and paste the contents of `SQL.sql`.
3. Run the entire script, or execute step by step:
    - Creates the `student_records` database
    - Defines tables: `students`, `courses`, `enrollments`
    - Inserts sample data
    - Executes example queries for analytics

## Database Schema

**students**
- student_id INTEGER PRIMARY KEY
- name TEXT
- email TEXT
- join_year INTEGER

**courses**
- course_id INTEGER PRIMARY KEY
- name TEXT
- credits INTEGER
- instructor TEXT

**enrollments**
- enroll_id INTEGER PRIMARY KEY
- student_id INTEGER (Foreign Key)
- course_id INTEGER (Foreign Key)
- grade TEXT

Foreign keys reference `students(student_id)` and `courses(course_id)`.

## Sample Data

Sample records are inserted into all three tables. Example:

**Students**

| student_id | name         | email           | join_year |
|------------|--------------|-----------------|-----------|
| 1          | Ram Kumar    | ram@email.com   | 2022      |
| 2          | Priya Singh  | priya@email.com | 2023      |
| 3          | Anil Reddy   | anil@email.com  | 2025      |
| 4          | Swetha Rao   | swetha@email.com| 2024      |

**Courses**

| course_id | name              | credits | instructor    |
|-----------|-------------------|---------|--------------|
| 101       | Database Systems  | 3       | Dr. Rao      |
| 102       | Algorithms        | 4       | Prof. Sharma |
| 103       | Operating Systems | 3       | Ms. Patel    |

**Enrollments**

| enroll_id | student_id | course_id | grade |
|-----------|------------|-----------|-------|
| 1         | 1          | 101       | A     |
| 2         | 2          | 101       | B     |
| 3         | 1          | 102       | C     |
| 4         | 3          | 103       | B     |

## Example Queries

Below queries are included in `SQL.sql` and demo major SQL features:

### List all students
SELECT * FROM students;

### Show students with their courses & grades
SELECT s.name, c.name AS course, e.grade
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id;

### Count students enrolled in each course
SELECT c.name AS course, COUNT(e.student_id) AS total_students
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.name;

### Find students who got an 'A'
SELECT s.name, c.name AS course
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE e.grade = 'A';

### CRUD operations
**Add new student**
INSERT INTO students VALUES (4, 'Swetha Rao', 'swetha@email.com', 2024);

**Update student email**
UPDATE students SET email = 'ramkumar@email.com' WHERE student_id = 1;

**Delete enrollment**
DELETE FROM enrollments WHERE enroll_id = 4;

## How to Use

- Run the script as-is for a complete database demo.
- Extend tables or sample data for larger datasets.
- Update queries to practice analytics and reporting.
- Use in coursework, interviews, or as a template for future projects.

## Author

Joijode Akhila  
Email: akhilajoijode@gmail.com  
GitHub: [github.com/JoijodeAkhila](https://github.com/JoijodeAkhila)

## Notes

- Tested with MySQL Workbench 8.x and VS Code + SQLTools extension.
- Scripts are self-contained — simply copy and execute!


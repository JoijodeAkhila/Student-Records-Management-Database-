# Student Records Management Database

## 📌 Project Overview
This project is a **Student Records Management System** built using **MySQL**. It is designed to efficiently manage academic data including students, courses, and enrollments using a normalized relational database structure.

---

## 🎯 Objectives
- Organize student and course data efficiently
- Maintain data integrity using constraints
- Enable easy retrieval and analysis using SQL queries
- Demonstrate CRUD operations and relational database concepts

---

## 🗂️ Database Schema

### 1. Students Table
Stores student details:
- `student_id` (Primary Key)
- `name`
- `email` (Unique)
- `join_year`

### 2. Courses Table
Stores course information:
- `course_id` (Primary Key)
- `name`
- `credits`
- `instructor`

### 3. Enrollments Table
Manages relationship between students and courses:
- `enroll_id` (Primary Key)
- `student_id` (Foreign Key)
- `course_id` (Foreign Key)
- `grade`

---

## 🔗 Relationships
- One student can enroll in multiple courses
- One course can have multiple students
- Implemented using the **Enrollments** table (Many-to-Many relationship)

---

## ⚙️ Features

- ✔ Normalized database design (3NF)
- ✔ Data integrity using:
  - Primary Keys
  - Foreign Keys
  - UNIQUE and CHECK constraints
- ✔ Efficient data retrieval using:
  - JOIN operations
  - Aggregation (`COUNT`, `GROUP BY`)
- ✔ Full CRUD operations:
  - Insert
  - Read
  - Update
  - Delete
- ✔ Indexing for improved performance

---

## 🧪 Sample Queries

### 1. Fetch Student Course Details
```sql
SELECT s.name AS student_name, c.name AS course_name, e.grade
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id;

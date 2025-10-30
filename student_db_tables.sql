-- =====================================
--  Student Assignment Submission System
-- =====================================

-- 1️⃣ Create Database
CREATE DATABASE IF NOT EXISTS student_db;
USE student_db;

-- 2️⃣ Create Tables
-- STUDENT TABLE
CREATE TABLE Student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE
);

-- ASSIGNMENT TABLE
CREATE TABLE Assignment (
    assignment_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    due_date DATE
);

-- SUBMISSION TABLE
CREATE TABLE Submission (
    submission_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    assignment_id INT,
    submission_date DATE,
    grade DECIMAL(5,2),
    FOREIGN KEY (student_id) REFERENCES Student(student_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (assignment_id) REFERENCES Assignment(assignment_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 3️⃣ Insert Sample Data
-- Insert Students
INSERT INTO Student (student_name, email) VALUES
('John Santos', 'john.santos@email.com'),
('Maria Lopez', 'maria.lopez@email.com'),
('Carlo Dizon', 'carlo.dizon@email.com');

-- Insert Assignments
INSERT INTO Assignment (title, due_date) VALUES
('Database Design', '2025-11-15'),
('SQL Query Practice', '2025-11-20'),
('Normalization Exercise', '2025-11-25');

-- Insert Submissions
INSERT INTO Submission (student_id, assignment_id, submission_date, grade) VALUES
(1, 1, '2025-11-14', 95.00),
(1, 2, '2025-11-19', 90.00),
(2, 1, '2025-11-15', 88.50),
(3, 3, '2025-11-24', 92.75);

-- 4️⃣ Test Select Queries
-- Show all students
SELECT * FROM Student;

-- Show all assignments
SELECT * FROM Assignment;

-- Show all submissions with student and assignment details
SELECT 
    s.submission_id,
    st.student_name,
    a.title AS assignment_title,
    s.submission_date,
    s.grade
FROM Submission s
JOIN Student st ON s.student_id = st.student_id
JOIN Assignment a ON s.assignment_id = a.assignment_id
ORDER BY s.submission_date;

-- 5️⃣ Verify Table Structures
DESCRIBE Student;
DESCRIBE Assignment;
DESCRIBE Submission;

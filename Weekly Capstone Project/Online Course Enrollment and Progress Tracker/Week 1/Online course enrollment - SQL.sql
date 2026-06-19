-- ONLINE COURSE ENROLLMENT AND PROGRESS TRACKER
-- DATABASE SCHEMA, CRUD OPERATIONS, STORED PROCEDURE

-- STEP 1: CREATE DATABASE
CREATE DATABASE IF NOT EXISTS capstone_courses_enrollment;
USE capstone_courses_enrollment;

-- STEP 2: CREATE TABLES

-- STUDENTS TABLE
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    date_joined DATE DEFAULT (CURRENT_DATE),
    status ENUM('active', 'inactive') DEFAULT 'active'
);

-- COURSES TABLE
CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(150) NOT NULL,
    category VARCHAR(50),
    duration_weeks INT,
    instructor VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ENROLLMENTS TABLE
CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrolled_date DATE DEFAULT (CURRENT_DATE),
    status ENUM('active', 'dropped', 'completed') DEFAULT 'active',
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    UNIQUE KEY unique_enrollment (student_id, course_id)
);

-- PROGRESS TABLE
CREATE TABLE progress (
    progress_id INT AUTO_INCREMENT PRIMARY KEY,
    enrollment_id INT NOT NULL,
    module_name VARCHAR(100) NOT NULL,
    is_completed BOOLEAN DEFAULT FALSE,
    completed_date DATE,
    FOREIGN KEY (enrollment_id) REFERENCES enrollments(enrollment_id)
);

-- STEP 3: INSERT SAMPLE DATA

-- INSERT STUDENTS
INSERT INTO students (full_name, email, phone) VALUES
('Arun Kumar',    'arun@gmail.com',   '9876543210'),
('Priya Sharma',  'priya@gmail.com',  '9123456780'),
('Rahul Verma',   'rahul@gmail.com',  '9345678901'),
('Sneha Nair',    'sneha@gmail.com',  '9456789012'),
('Karthik Raja',  'karthik@gmail.com','9567890123');

-- INSERT COURSES
INSERT INTO courses (course_name, category, duration_weeks, instructor) VALUES
('MySQL for Beginners',      'Database',   4,  'Dr. Ramesh'),
('MongoDB Essentials',       'Database',   3,  'Prof. Anitha'),
('Python Programming',       'Programming',6,  'Mr. Suresh'),
('Web Development Basics',   'Web',        5,  'Ms. Deepa'),
('Data Science Fundamentals','Data',       8,  'Dr. Pradeep');

-- INSERT ENROLLMENTS
INSERT INTO enrollments (student_id, course_id, status) VALUES
(1, 1, 'active'),
(1, 3, 'active'),
(2, 1, 'completed'),
(2, 2, 'active'),
(3, 3, 'dropped'),
(4, 4, 'active'),
(5, 5, 'active'),
(3, 1, 'active'),
(4, 2, 'completed'),
(5, 3, 'active');

-- INSERT PROGRESS
INSERT INTO progress (enrollment_id, module_name, is_completed, completed_date) VALUES
(1, 'Introduction to SQL',       TRUE,  '2024-01-05'),
(1, 'CRUD Operations',           TRUE,  '2024-01-10'),
(1, 'Joins and Subqueries',      FALSE,  NULL),
(1, 'Stored Procedures',         FALSE, NULL),
(2, 'Python Basics',             TRUE,  '2024-01-06'),
(2, 'Functions and Loops',       TRUE,  '2024-01-12'),
(2, 'OOP in Python',             TRUE,  '2024-01-18'),
(3, 'Introduction to SQL',       TRUE,  '2024-01-04'),
(3, 'CRUD Operations',           TRUE,  '2024-01-09'),
(3, 'Joins and Subqueries',      TRUE,  '2024-01-15'),
(3, 'Stored Procedures',         TRUE,  '2024-01-20'),
(4, 'Introduction to MongoDB',   TRUE,  '2024-01-07'),
(4, 'CRUD in MongoDB',           TRUE,  '2024-01-13'),
(4, 'Aggregation Framework',     TRUE,  '2024-01-19');

-- STEP 4: CRUD OPERATIONS

-- READ: VIEW ALL STUDENTS
SELECT * FROM students;

-- READ: VIEW ALL ENROLLMENTS WITH STUDENT AND COURSE NAMES
SELECT 
    e.enrollment_id,
    s.full_name AS student,
    c.course_name AS course,
    e.enrolled_date,
    e.status
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c  ON e.course_id  = c.course_id;

-- UPDATE: UPDATE ENROLLMENT STATUS TO COMPLETED
UPDATE enrollments
SET status = 'completed'
WHERE student_id = 1 AND course_id = 1;

-- UPDATE: MARK A PROGRESS MODULE AS COMPLETED
UPDATE progress
SET is_completed = TRUE, completed_date = CURRENT_DATE
WHERE progress_id = 3;

-- DELETE: REMOVE A DROPPED ENROLLMENT
SET SQL_SAFE_UPDATES = 0;
DELETE FROM enrollments
WHERE status = 'dropped';
SET SQL_SAFE_UPDATES = 1;

-- STEP 5: STORED PROCEDURE TO CALCULATE COMPLETION PERCENTAGE

DELIMITER $$

CREATE PROCEDURE GetCompletionPercentage(
    IN p_student_id INT,
    IN p_course_id  INT
)
BEGIN
    DECLARE total_modules INT DEFAULT 0;
    DECLARE completed_modules INT DEFAULT 0;
    DECLARE completion_pct DECIMAL(5,2) DEFAULT 0.00;
    DECLARE v_enrollment_id INT DEFAULT 0;

    -- GET ENROLLMENT ID FOR THE STUDENT AND COURSE
    SELECT enrollment_id INTO v_enrollment_id
    FROM enrollments
    WHERE student_id = p_student_id AND course_id = p_course_id
    LIMIT 1;

    -- COUNT TOTAL MODULES
    SELECT COUNT(*) INTO total_modules
    FROM progress
    WHERE enrollment_id = v_enrollment_id;

    -- COUNT COMPLETED MODULES
    SELECT COUNT(*) INTO completed_modules
    FROM progress
    WHERE enrollment_id = v_enrollment_id AND is_completed = TRUE;

    -- CALCULATE PERCENTAGE
    IF total_modules > 0 THEN
        SET completion_pct = (completed_modules / total_modules) * 100;
    END IF;

    -- RETURN RESULT
    SELECT 
        p_student_id                        AS student_id,
        p_course_id                         AS course_id,
        total_modules                       AS total_modules,
        completed_modules                   AS completed_modules,
        ROUND(completion_pct, 2)            AS completion_percentage;
END$$

DELIMITER ;

-- CALL THE STORED PROCEDURE
CALL GetCompletionPercentage(1, 1);
CALL GetCompletionPercentage(2, 1);

-- STEP 6: INDEXES FOR FAST SEARCH

-- INDEX ON STUDENT ID IN ENROLLMENTS
CREATE INDEX idx_enrollment_student ON enrollments(student_id);

-- INDEX ON COURSE ID IN ENROLLMENTS
CREATE INDEX idx_enrollment_course ON enrollments(course_id);

-- INDEX ON ENROLLMENT ID IN PROGRESS
CREATE INDEX idx_progress_enrollment ON progress(enrollment_id);

-- INDEX ON EMAIL IN STUDENTS FOR QUICK LOOKUP
CREATE INDEX idx_student_email ON students(email);

-- STEP 7: REPORT QUERIES

-- REPORT 1: COURSE COMPLETION RATE
SELECT 
    c.course_name,
    COUNT(e.enrollment_id)                                               AS total_enrolled,
    SUM(e.status = 'completed')                                          AS total_completed,
    ROUND(SUM(e.status = 'completed') / COUNT(e.enrollment_id) * 100, 2) AS completion_rate_pct
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name;

-- REPORT 2: DROPOUT REPORT
SELECT 
    s.full_name   AS student,
    c.course_name AS course,
    e.enrolled_date
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c  ON e.course_id  = c.course_id
WHERE e.status = 'dropped';

-- REPORT 3: MOST POPULAR COURSES BY ENROLLMENT
SELECT 
    c.course_name,
    COUNT(e.enrollment_id) AS total_enrollments
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name
ORDER BY total_enrollments DESC;
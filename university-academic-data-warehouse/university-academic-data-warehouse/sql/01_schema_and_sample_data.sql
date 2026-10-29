-- Schema and sample records. Run INSERT statements only once on a clean database.
CREATE DATABASE IF NOT EXISTS university_dw;
USE university_dw;

CREATE TABLE IF NOT EXISTS dim_student (
  student_id INT, student_name STRING, department STRING, admission_year INT
) STORED AS PARQUET;

CREATE TABLE IF NOT EXISTS dim_course (
  course_id INT, course_name STRING, credits INT
) STORED AS PARQUET;

CREATE TABLE IF NOT EXISTS dim_faculty (
  faculty_id INT, faculty_name STRING, department STRING
) STORED AS PARQUET;

CREATE TABLE IF NOT EXISTS dim_semester (
  semester_id STRING, academic_year STRING, semester_name STRING
) STORED AS PARQUET;

CREATE TABLE IF NOT EXISTS fact_marks (
  student_id INT, course_id INT, faculty_id INT, semester_id STRING,
  marks_obtained DOUBLE
) STORED AS PARQUET;

INSERT INTO dim_student VALUES
(1, 'Aarav Sharma', 'CSE', 2024),
(2, 'Diya Verma', 'CSE', 2024),
(3, 'Kabir Singh', 'ECE', 2023),
(4, 'Anaya Gupta', 'ECE', 2024),
(5, 'Rohan Mehta', 'IT', 2023);

INSERT INTO dim_course VALUES
(101, 'Database Systems', 4),
(102, 'Cloud Computing', 3),
(103, 'Operating Systems', 4);

INSERT INTO dim_faculty VALUES
(201, 'Dr. Sharma', 'CSE'),
(202, 'Dr. Verma', 'IT');

INSERT INTO dim_semester VALUES
('S1', '2025-2026', 'Odd Semester'),
('S2', '2025-2026', 'Even Semester');

INSERT INTO fact_marks VALUES
(1, 101, 201, 'S1', 88),
(1, 102, 202, 'S1', 91),
(2, 101, 201, 'S1', 76),
(2, 103, 201, 'S1', 82),
(3, 101, 201, 'S1', 69),
(3, 102, 202, 'S1', 85),
(4, 103, 201, 'S2', 90),
(4, 102, 202, 'S2', 87),
(5, 101, 201, 'S2', 95),
(5, 103, 201, 'S2', 89);

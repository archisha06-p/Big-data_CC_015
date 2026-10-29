USE university_dw;

-- Average marks by course
SELECT c.course_name, ROUND(AVG(f.marks_obtained), 2) AS average_marks
FROM fact_marks f JOIN dim_course c ON f.course_id = c.course_id
GROUP BY c.course_name ORDER BY average_marks DESC;

-- Average marks by student
SELECT s.student_name, ROUND(AVG(f.marks_obtained), 2) AS average_marks
FROM fact_marks f JOIN dim_student s ON f.student_id = s.student_id
GROUP BY s.student_name ORDER BY average_marks DESC;

-- Average marks by department
SELECT s.department, ROUND(AVG(f.marks_obtained), 2) AS average_marks
FROM fact_marks f JOIN dim_student s ON f.student_id = s.student_id
GROUP BY s.department ORDER BY average_marks DESC;

-- Average marks by semester
SELECT d.semester_name, ROUND(AVG(f.marks_obtained), 2) AS average_marks
FROM fact_marks f JOIN dim_semester d ON f.semester_id = d.semester_id
GROUP BY d.semester_name ORDER BY average_marks DESC;

-- Top three students by average marks
SELECT s.student_name, ROUND(AVG(f.marks_obtained), 2) AS average_marks
FROM fact_marks f JOIN dim_student s ON f.student_id = s.student_id
GROUP BY s.student_name ORDER BY average_marks DESC LIMIT 3;

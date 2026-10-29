USE university_dw;

CREATE TABLE IF NOT EXISTS bench_marks (
  student_id INT, course_id INT, faculty_id INT, semester_id STRING,
  marks_obtained DOUBLE
) STORED AS PARQUET;

-- Deterministically generate n = 0..9999 (10,000 rows).
INSERT OVERWRITE TABLE bench_marks
SELECT CAST((n % 500) + 1 AS INT),
       CAST((n % 10) + 101 AS INT),
       CAST((n % 5) + 201 AS INT),
       CASE WHEN n % 2 = 0 THEN 'S1' ELSE 'S2' END,
       CAST(50 + (n * 17 % 51) AS DOUBLE)
FROM (
  SELECT d1 * 1000 + d2 * 100 + d3 * 10 + d4 AS n
  FROM (SELECT 1 AS dummy) base
  LATERAL VIEW stack(10,0,1,2,3,4,5,6,7,8,9) t1 AS d1
  LATERAL VIEW stack(10,0,1,2,3,4,5,6,7,8,9) t2 AS d2
  LATERAL VIEW stack(10,0,1,2,3,4,5,6,7,8,9) t3 AS d3
  LATERAL VIEW stack(10,0,1,2,3,4,5,6,7,8,9) t4 AS d4
) generated;

CREATE TABLE IF NOT EXISTS bench_marks_partitioned (
  student_id INT, course_id INT, faculty_id INT, marks_obtained DOUBLE
)
PARTITIONED BY (semester_id STRING) STORED AS PARQUET;

SET hive.exec.dynamic.partition=true;
SET hive.exec.dynamic.partition.mode=nonstrict;
INSERT OVERWRITE TABLE bench_marks_partitioned PARTITION (semester_id)
SELECT student_id, course_id, faculty_id, marks_obtained, semester_id
FROM bench_marks;

CREATE TABLE IF NOT EXISTS bench_marks_bucketed (
  student_id INT, course_id INT, faculty_id INT, semester_id STRING,
  marks_obtained DOUBLE
)
CLUSTERED BY (student_id) INTO 4 BUCKETS STORED AS PARQUET;

SET mapreduce.job.reduces=4;
INSERT OVERWRITE TABLE bench_marks_bucketed
SELECT student_id, course_id, faculty_id, semester_id, marks_obtained
FROM bench_marks DISTRIBUTE BY student_id SORT BY student_id;

SELECT COUNT(*) AS total_rows FROM bench_marks;
SELECT COUNT(DISTINCT student_id) AS distinct_students FROM bench_marks;
SELECT COUNT(DISTINCT course_id) AS distinct_courses FROM bench_marks;
SELECT semester_id, COUNT(*) AS rows_per_semester
FROM bench_marks GROUP BY semester_id ORDER BY semester_id;

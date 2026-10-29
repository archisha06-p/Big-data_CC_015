USE university_dw;

CREATE TABLE IF NOT EXISTS fact_marks_partitioned (
  student_id INT, course_id INT, faculty_id INT, marks_obtained DOUBLE
)
PARTITIONED BY (semester_id STRING)
STORED AS PARQUET;

SET hive.exec.dynamic.partition=true;
SET hive.exec.dynamic.partition.mode=nonstrict;

INSERT OVERWRITE TABLE fact_marks_partitioned
PARTITION (semester_id)
SELECT student_id, course_id, faculty_id, marks_obtained, semester_id
FROM fact_marks;

SHOW PARTITIONS fact_marks_partitioned;
SELECT semester_id, COUNT(*) AS row_count
FROM fact_marks_partitioned GROUP BY semester_id ORDER BY semester_id;

CREATE TABLE IF NOT EXISTS fact_marks_bucketed (
  student_id INT, course_id INT, faculty_id INT, semester_id STRING,
  marks_obtained DOUBLE
)
CLUSTERED BY (student_id) INTO 4 BUCKETS STORED AS PARQUET;

SET mapreduce.job.reduces=4;
INSERT OVERWRITE TABLE fact_marks_bucketed
SELECT student_id, course_id, faculty_id, semester_id, marks_obtained
FROM fact_marks DISTRIBUTE BY student_id SORT BY student_id;

DESCRIBE FORMATTED fact_marks_partitioned;
DESCRIBE FORMATTED fact_marks_bucketed;
SELECT COUNT(*) AS source_rows FROM fact_marks;
SELECT COUNT(*) AS partitioned_rows FROM fact_marks_partitioned;
SELECT COUNT(*) AS bucketed_rows FROM fact_marks_bucketed;

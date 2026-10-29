USE university_dw;

-- Run each query several times and record actual wall-clock times.
EXPLAIN SELECT COUNT(*), ROUND(AVG(marks_obtained), 2)
FROM bench_marks WHERE semester_id = 'S1';
SELECT COUNT(*), ROUND(AVG(marks_obtained), 2)
FROM bench_marks WHERE semester_id = 'S1';

EXPLAIN SELECT COUNT(*), ROUND(AVG(marks_obtained), 2)
FROM bench_marks_partitioned WHERE semester_id = 'S1';
SELECT COUNT(*), ROUND(AVG(marks_obtained), 2)
FROM bench_marks_partitioned WHERE semester_id = 'S1';

EXPLAIN SELECT COUNT(*), ROUND(AVG(marks_obtained), 2)
FROM bench_marks_bucketed WHERE semester_id = 'S1';
SELECT COUNT(*), ROUND(AVG(marks_obtained), 2)
FROM bench_marks_bucketed WHERE semester_id = 'S1';

SELECT COUNT(*) AS standard_rows FROM bench_marks;
SELECT COUNT(*) AS partitioned_rows FROM bench_marks_partitioned;
SELECT COUNT(*) AS bucketed_rows FROM bench_marks_bucketed;

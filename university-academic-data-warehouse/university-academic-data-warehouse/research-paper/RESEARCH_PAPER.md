# UNIVERSITY ACADEMIC DATA WAREHOUSE USING APACHE HIVE

**Institution:** SRM Institute of Science and Technology

**Authors**
- Akshay Pratap Singh — Registration No. RA2411028030002
- Parth Bhardwaj — Registration No. RA2411028030014
- Archisha Pandey — Registration No. RA2411028030015

## Abstract
Universities generate academic information about students, courses, faculty, semesters, and examination performance. A data warehouse can integrate such information for analytical reporting. This paper presents an educational implementation of a University Academic Data Warehouse using Apache Hive 4.0.0. The system uses student, course, faculty, and semester dimension tables with a fact table containing marks. HiveQL queries support course-wise, department-wise, student-wise, and semester-wise analysis. The implementation also creates semester-partitioned and student-bucketed representations and a synthetic benchmark dataset of 10,000 records. Functional query outputs were checked for consistency across the benchmark representations. Numerical timing values and saved execution plans are not available in this paper, so no quantitative performance improvement is claimed.

**Keywords:** Academic Data Warehouse, Apache Hive, HiveQL, Dimensional Modeling, Parquet, Partitioning, Bucketing, Academic Analytics.

## 1. Introduction
Universities maintain records about admissions, courses, faculty assignments, semesters, and marks. Integrating these records into a data warehouse can simplify historical analysis and reporting. Apache Hive provides a SQL-like interface for analytical queries over warehouse data. This project demonstrates a small dimensional model and explores data organization using partitioning and bucketing in a local Docker environment.

## 2. Problem Statement
Academic records may be distributed across separate systems and files, making consistent reporting difficult. The project addresses the design of a centralized analytical schema and repeatable queries for academic summaries, alongside a controlled demonstration of Hive table organization.

## 3. Objectives
1. Design a dimensional academic warehouse.
2. Implement student, course, faculty, semester, and marks tables.
3. Query course, department, student, and semester averages.
4. Create semester-partitioned and student-bucketed tables.
5. Generate 10,000 synthetic benchmark rows.
6. Compare query output consistency and document the requirements for a valid performance evaluation.

## 4. Technical Background
A data warehouse is organized for analysis and reporting. Dimensional modeling separates descriptive dimensions from measurable facts. Apache Hive provides HiveQL for filtering, joining, and aggregating warehouse data. Parquet is a columnar storage format. Partitioning divides a table into logical subsets based on partition values; bucketing distributes records into a specified number of buckets using a bucketing column. These techniques may benefit some workloads, but their performance effects depend on data, queries, execution plans, and configuration.

## 5. System Architecture
The project includes a data layer of sample and synthetic records, a Hive storage layer using Parquet, four dimension tables, one fact table, analytical HiveQL queries, and benchmark copies in conventional, partitioned, and bucketed forms. The fact table's intended grain is one marks record for a student, course, faculty assignment, and semester.

## 6. Methodology
The implementation uses Windows, WSL 2, Docker, Apache Hive 4.0.0, Beeline, HiveQL, and Parquet. The sample warehouse contains five students, three courses, two faculty members, two semesters, and ten marks records. Analytical queries join the fact table with dimensions and calculate averages. A separate table is partitioned by semester; another is configured with four buckets based on student ID. A deterministic HiveQL generator creates 10,000 benchmark records, which are copied into conventional, partitioned, and bucketed tables. A semester-filtered `COUNT` and `AVG` query is used for comparison, with `EXPLAIN` intended to inspect execution plans.

## 7. Results
The schema, sample queries, partitioned and bucketed table setup, and 10,000-row benchmark generation were reported as successful. The filtered benchmark query results were reported to match across the three table representations. Actual numerical timings and saved `EXPLAIN` outputs are not available in this document. Therefore, the results establish functional consistency for the tested query but do not demonstrate a speedup or a quantitative performance improvement.

| Evaluation item | Status |
|---|---|
| Sample warehouse queries | Executed successfully, as reported |
| Partitioned table | Setup reported successful |
| Bucketed table | Setup reported successful |
| Benchmark dataset | 10,000 synthetic rows |
| Filtered result consistency | Matching outputs reported |
| Execution-time values | Not included |
| Verified speedup | Not established |
| Saved execution plans | Not available |

## 8. Discussion
The dimensional model supports reusable academic summaries and demonstrates the use of Hive for analytical processing. Semester partitioning is relevant to semester-filtered queries, while bucketing creates a defined organization by student ID. Neither technique guarantees faster execution. A rigorous comparison should record repeated runtimes, system settings, query plans, and data-layout verification.

## 9. Limitations
- The dataset is synthetic and small.
- The environment is local Docker rather than a distributed production cluster.
- Numerical execution times and saved execution plans are unavailable.
- Only a limited benchmark query is considered.
- The simplified schema omits assessment attempts, registration history, and full data-quality workflows.
- Security, privacy governance, and production operations are not evaluated.

## 10. Future Scope
Future work can test larger datasets, repeat each query under documented conditions, compare median runtime and resource use, inspect execution plans, add automated ingestion and validation, develop dashboards, and implement appropriate access controls before using real institutional data.

## 11. Conclusion
The project demonstrates an educational academic data warehouse using Apache Hive, with dimensional tables, analytical queries, semester partitioning, student-based bucketing, and a 10,000-row synthetic benchmark. Matching outputs provide evidence of functional consistency for the tested query. Performance benefits remain unproven because the numerical timings and saved execution plans are unavailable. Larger-scale and reproducible experiments are needed before drawing conclusions about performance or production suitability.

## References
1. Apache Software Foundation, *Apache Hive Documentation*. https://hive.apache.org/
2. Apache Software Foundation, *Apache Hive Language Manual*. https://cwiki.apache.org/confluence/display/Hive/LanguageManual
3. Apache Software Foundation, *Apache Parquet Documentation*. https://parquet.apache.org/docs/
4. Apache Software Foundation, *Apache Hadoop Documentation*. https://hadoop.apache.org/docs/
5. Kimball, R. and Ross, M., *The Data Warehouse Toolkit: The Definitive Guide to Dimensional Modeling*, 3rd ed., Wiley, 2013.

## Author Contributions
Suggested allocation—please edit to reflect actual contributions:
- Akshay Pratap Singh: system design, data modeling, and academic analysis.
- Parth Bhardwaj: HiveQL implementation, table organization, and benchmark setup.
- Archisha Pandey: documentation, interpretation, limitations, and future scope.

## Acknowledgment
The authors acknowledge SRM Institute of Science and Technology and the open-source Apache project resources used for this educational implementation.

## Declaration
This paper reports a limited educational implementation. Any performance claims added later must be supported by actual measurements and documented test conditions.

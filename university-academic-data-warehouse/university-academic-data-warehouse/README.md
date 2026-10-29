# University Academic Data Warehouse using Apache Hive

An educational data warehousing project using Apache Hive 4.0.0, HiveQL, and Parquet. It models university academic records, runs analytical queries, and demonstrates semester partitioning and student-based bucketing.

## Authors
- Akshay Pratap Singh — RA2411028030002
- Parth Bhardwaj — RA2411028030014
- Archisha Pandey — RA2411028030015

**Institution:** SRM Institute of Science and Technology

## Features
- Dimensional model: student, course, faculty, semester, and marks fact tables
- Analytical queries for course, department, student, and semester summaries
- Semester-partitioned and four-bucket table examples
- Synthetic benchmark dataset with 10,000 records
- Benchmark result template for actual measurements

## Requirements
Docker Desktop and PowerShell (or another Docker-capable terminal).

## Start Hive
```powershell
docker pull apache/hive:4.0.0
docker run -d --name hive4 -p 10000:10000 -p 10002:10002 -e SERVICE_NAME=hiveserver2 apache/hive:4.0.0
docker exec -it hive4 beeline -u "jdbc:hive2://localhost:10000/default"
```
If `hive4` already exists, use `docker start hive4` rather than running `docker run` again.

## Run SQL scripts
Run these files in order from the Beeline prompt, or copy each file into the container and use `beeline -f`:
1. `sql/01_schema_and_sample_data.sql`
2. `sql/02_analytical_queries.sql`
3. `sql/03_partitioning_and_bucketing.sql`
4. `sql/04_benchmark_generation.sql`
5. `sql/05_benchmark_queries.sql`

PowerShell example from this repository's root:
```powershell
docker cp .\sql\01_schema_and_sample_data.sql hive4:/tmp/01_schema_and_sample_data.sql
docker exec -it hive4 beeline -u "jdbc:hive2://localhost:10000/default" -f /tmp/01_schema_and_sample_data.sql
```
Repeat for the other scripts. The sample-data insert script appends records; do not run it repeatedly against an already populated database unless you intentionally want duplicate sample rows. Benchmark generation uses `INSERT OVERWRITE`.

## Benchmark integrity
Compare equivalent query outputs across conventional, partitioned, and bucketed tables. Record actual timings in `results/benchmark-results-template.csv`. Do not infer or invent timings. Use `EXPLAIN` to inspect query plans. A 10,000-row local benchmark does not establish production-scale performance.

## Limitations
Data is synthetic. This educational project does not implement a production ingestion pipeline, institutional access controls, privacy governance, or backups. No quantitative performance improvement is claimed without recorded measurements and query-plan evidence.

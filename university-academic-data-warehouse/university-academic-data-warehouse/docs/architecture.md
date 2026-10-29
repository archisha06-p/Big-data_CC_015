# System architecture

```text
Sample academic data
        |
        v
 Apache Hive / HiveQL
        |
  +-----+------------------+
  |                        |
Dimension tables        Fact table
  |                        |
  +------ joins/aggregations
              |
              v
     Academic summaries

Benchmark copies: conventional / semester-partitioned / student-bucketed
```

The intended fact-table grain is one student-course-faculty-semester marks record. Production use would require a more explicit assessment/attempt key and data-quality rules.

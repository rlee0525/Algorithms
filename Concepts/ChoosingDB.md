# RDBMS or NoSQL

## Nature of Data
- RDBMS: simple tabular structure
- NoSQL: complicated data with multiple level of nesting (e.g. geo-spatial, engineering parts), easily represented as JSON

## Data Volatility
- RDBMS: rigid schema - correct design the first time is important as it is slow to update (low flexibility)
- NoSQL: popular among Web-centric businesses that require dynamic schema (high flexibility)

###### As DB grows in size or # of users multiply, RDBMS often has performance issues

## Operational Issues (scale, performance, high availability)
Usual Steps for companies with operational issues:
- Vertical scaling (more power with added CPU and RAM but high cost) => processors are added (linear scaling) until bottleneck
- Horizontal scaling (clustering) - adding more machines often provided RDBMS => expensive and complex

- Consider NoSQL (Essential especially in Big Data environment) => built to host distributed DB for online systems, high availability but with possible consistency issues

###### RDBMS => multi-join tables => high latency
###### RDBMS => prioritize reliability (via ACID) and easier maintenance over performance
###### ACID (atomicity, consistency, isolation, durability) - guaranteed for RDBMS but not noSQL

## Data Warehousing and Analytics
- RDBMS: ideally suited for complex query and analysis (even Hadoop data is sometimes loaded back to an RDBMS for reporting purposes)
- NoSQL: real-time analytics for operational data

###### NoSQL taxonomy supports key-value stores, document store, BigTable, and graph databases
###### NoSQL => non-relational, distributed, open-source and horizontally scalable


# Row Store and Column Store Databases

## Basic
- Row: great for transaction processing
- Column: great for highly analytical query models

- Row: writes very quickly
- Column: writes slowly but reads very quickly

- Row: standard traditional DB
- Column: each field from each table is stored in its own file or set of files, minimize i/o by only accessing the files that contained data from the requested fields

## Normalization Versus Denormalization

- Column: many columnar databases prefer a denormalized data structure => no joins would need to be processed and thus the query will likely run much faster

- Row: normalized data => allows data to be written to the database in a highly efficient manner - need to record just the relevant details and thus writes much faster. Updating is also more efficient as it affects only one record in the table. In the columnar DB, many records might need updating.

## Conclusion

- Often, mixture of the two. The initial write is to a row-based system. Then, write the data (or the relevant parts of the data) to a column based database to allow for fast analytic queries.

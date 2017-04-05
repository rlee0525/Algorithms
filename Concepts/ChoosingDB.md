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

## Data Warehousing and Analytics
- RDBMS: ideally suited for complex query and analysis (even Hadoop data is sometimes loaded back to an RDBMS for reporting purposes)
- NoSQL: real-time analytics for operational data

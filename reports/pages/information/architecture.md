# Architectural Decision

For this use case, a serverless BI approach has been utilized.

The serverless BI is built up with 3 components:

1. Duckdb as the database
2. dbt as the transformation (and ingestion!) layer
3. Evidence as the presentation layer

The serverless BI architecture is orchestrated by Github Actions (by utilizing the 2000 free minutes you get per month).

This stack is suited towards people with more SQL knowledge compared to python

### Duckdb
The base component of the stack is duckdb, which is an embedded OLAP database that excels at doing analytical queries on a single machine.
This was chosen to be utilized since we will do a full-refresh each iteration and the data does not need to be exposed to any other system apart from the presentation layer.
However, this can be changed in duckdb due to the support of httpfs extension. This particular extensions makes it possible to save and load tables to external s3 compliant locations (Azure, uncertain).
Which makes it easy to convert the backend to be a datalake instead.
Since SQL dialect of duckdb is postgres-compliant, it is an easy switch to migrate towards a central database instead.

### dbt
When combining duckdb and dbt, you are able to run python models without bringing in additional compute (such as a spark cluster / snowpark). As such, although maybe not 100% recommended, you can do the Extract & Load into raw tables with python models. 
Thus it is possible to run the entire ELT DAG without using any other external tools. Apart from this particular combination, dbt was chosen due to the fact that it becomes easy to write DAGs with SQL, it's table level lineage and it's built in test system (Not used in this repo).

### Evidence
Evidence is a new tool that generates dashboard as static sites from markdown and SQL. In this serverless architecture approach it is a perfect match, since it removes the hosting of a BI tool such as superset, tableau or PowerBI (or any other data app frameworks). The generated report from evidence can be hosted in github pages, netlify or similar.

## Drawbacks

### Self serving analytics
One of the major drawbacks of the serverless BI approach is that it doesn't promote self serving analytics at all, since the systems will be completly isolated in this approach.
This can be mitigated by using external materializations (as mentioned above) for duck-dbt, hosting a trino server for querying the data in the lake and hosting superset. Of course we loose the serverless approach on this, but we gain the ability to promote self serving analytics.

### Scale
Another drawback is of course that this solution doesn't scale well. You can of course mitigate that by doing what was

## Benefits

### Infrastructure
The major benefit of this approach is that no infrastructure is needed. Which is particularly appealing in this use case. Since we have no infrastructure, the cost will be reduced significantly utilizing this approach

### Simple Stack




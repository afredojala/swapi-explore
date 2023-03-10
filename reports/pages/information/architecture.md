# Architectural Decision

Following the assumptions, a serverless BI approach has been utilized.

The serverless BI is built up with 3 components:

1. Duckdb as the database
2. dbt as the transformation (and ingestion!) layer
3. Evidence as the presentation layer

The serverless BI architecture is orchestrated by Github Actions (by utilizing the 2000 free minutes you get per month).

### Duckdb
The pillar of the stack is duckdb, which is an embedded OLAP database that excels at doing analytical queries on a single machine.
Duckdbs internal database was chosen to be utilized since we will do a full-refresh each run and the data does not need to be exposed to any other system apart from the presentation layer.

However, this can be changed in duckdb due to the support of httpfs extension. This particular extensions makes it possible to save and load tables to external s3 compliant locations (Azure, Especially since they implement the fsspec on 0.7.0!).
Thus makes it easy to convert the backend to be a datalake instead.
Since SQL dialect of duckdb is postgres-compliant, it is an easy switch to migrate towards a central database instead.

### dbt
When combining duckdb and dbt, you are able to run python models without bringing in additional compute (such as a spark cluster / snowpark). Which brings some extra convience if something is tedious to do in SQL but rather simple to do with python.

With dbt and duckdb, although maybe not 100% recommended, you can do the Extract & Load into raw tables with python models.
Thus it is possible to run the entire ELT DAG without using any other external tools.

Otherwise it would be possible to replace the duckdbt ingestion layer with meltano for example (if we want to continue the serverless approach) to do the EL.

dbt were also chosen due to the fact that it becomes easy to write DAGs with SQL, its table level lineage and its built in test system (Not used in this repo).

### Evidence
Evidence is a new tool that generates dashboard as static sites from markdown and SQL.
In this serverless architecture approach it is a perfect match, since it removes the hosting of a BI tool such as superset, tableau or PowerBI (or any other data app frameworks).
The generated report from evidence can be hosted in github pages, netlify or nginx.

## Drawbacks

### Self serving analytics
One of the major drawbacks of the serverless BI approach is that it doesn't promote self serving analytics at all, since the systems will be completely isolated in this approach.
This can be mitigated by using external materializations (as mentioned above) for duck-dbt. Hosting a trino server for querying the data and hosting superset (or lightdash) for visualization.
Of course we would loose the serverless approach with these changes, but we gain the ability to promote self serving analytics and expose the extracted & transformed data to a larger audience.

### Scale
Another drawback is of course that this solution doesn't scale well. 
## Benefits

### Infrastructure
The major benefit of this approach is that no infrastructure is needed. Which is particularly appealing in this use case. Since we have no infrastructure, the cost will be reduced significantly utilizing this approach.

### Simple Stack



# Other approaches, Non serverless

## Dagster & Postgres

Another approach, and a more python centric one, would be to switch out duckdb to postgres and github actions with dagster.
We would still utilize dbt for the transformation, but move the ingestion into dagster Software Defined assets. 
One benefit of dagster compared to the other is that dagster can provide an holistic view of the lineage within the chosen data stack.
The combination of airbyte, dbt and dagster is a powerful and easy way to get started with the modern data stack.



# Star Wars API

For this site, the [Star Wars API](https://swapi.dev) has been utilized.

The star wars API has several endpoints that contains information regarding the Star Wars movies
and its universe.

Before continuing on, I will make some assumptions that answers some details regarding the architectural decision.

## Assumption 1
No real time insights are needed, so we can ignore the streaming use case and focus on batch processing.

## Assumption 2
Another is that the data on the endpoints is considered to be static.

## Assumption 3
Due to the static dataset and the relative small size, we do not need to consider incremental loading or a partitioning scheme.
Instead we can utilize a full-refresh approach. Where the latest
version of the data from the API endpoints is extracted each time we do a full-refresh of the source data.

## Assumption 4
Due to the static nature, we can that the pipeline will be idempotent, at least for this particular use case.


# Data modelling

Modelling approach will be used as a ordinary raw/staging/mart approach.
Where the raw data has the raw responses, staging is cleaned a little bit and the mart contains the golden dataset utilized for analysis.



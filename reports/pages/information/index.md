# Star Wars API

The star wars API has several endpoints that contains information regarding the Star Wars movies
and its universe.

The assumption of thehosted data on the endpoint is that it is considered to be static (apart from smaller changes such as misstakes).
No real time insights are needed, so we can ignore the streaming use case and focus on batch processing.

Due to the rather static nature (and small data) we do not need to consider incremental loading or a partitioning scheme.
Instead we can conclude that we can utilize a full-refresh approach, where we take the latest
version of the data from the API endpoints and overwrite what we currently have.



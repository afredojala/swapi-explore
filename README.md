# SWAPI inspection

To see the results and documentation go to [this link](https://gifted-swanson-ae14c7.netlify.app/)

To get your local environment up run

```
make prequisite
```

This will create a virtualenvironment, install necessary packages and create raw python models


Then to create everything just run the command

```
make create-report
```

which will run all necessary transformations and create a dashboard that is hosted on localhost:3000


## TODO

### Increase developer experience.
A Limitation with duckdb, only one thread per database. Utilize a postgres proxy (like buenavista) to handle multiple connection to better develop locally

### Increase developer experience

Dockerize the complete approach, can share the duckdb database between container and run everything with compose


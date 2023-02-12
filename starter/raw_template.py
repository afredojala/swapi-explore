from pandas import DataFrame
import requests
import time

def model(dbt, sess):
    """
    dbt Model for extracting poeple

    The get function can be extracted as
    """
    response = requests.get("https://swapi.dev/api/{{endpoint}}/")
    data = response.json()
    if not data['next']:
        return DataFrame(data['results'])

    results = data['results']
    while True:
        response = requests.get(data['next'])
        data = response.json()
        results.extend(data['results'])
        if not data['next']:
            break
        time.sleep(.5)
    return DataFrame(results)



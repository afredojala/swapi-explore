# Episode Breakdown

This is a small investigation regarding different aggregated facts for the different movies

## People

```fct_episode
select
  dim_films.title,
  'Episode ' || dim_films.episode_id || ': ' || dim_films.title as title_and_film,
  dim_films.release_date,
  fct_movie_people.*
from fct_movie_people
left join dim_films on dim_films.id = fct_movie_people.id
order by dim_films.id
```

<BarChart data={fct_episode} x=title y=nr_characters title="Character per movie"/>

<LineChart data={fct_episode} x=title y=average_height title="Average Height per movie" />

<LineChart data={fct_episode} x=title y=average_mass title="Average mass per movie" />

Here we can see that the average mass decline when movie 3 & 4 is released. Presumably this is because of the ewoks in episode 6
and anakin skywalker as young in episode one (movie 4)

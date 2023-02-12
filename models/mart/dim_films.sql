with source as (
  select
    *
  from {{ ref('stg_films')}}
),

final as (
  select
    id,
    title,
    episode_id,
    opening_crawl,
    director,
    producer,
    release_date
  from source
)

select * from final

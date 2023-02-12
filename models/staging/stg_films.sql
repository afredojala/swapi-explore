with source as (
  select
    *
  from {{ ref('raw_films') }}
),


final as (
  select
    {{ get_id('url') }} as id,
    title,
    episode_id,
    opening_crawl,
    director,
    producer,
    release_date,
    {{ array_to_id('characters') }} as characters,
    {{ array_to_id('planets') }} as planets,
    {{ array_to_id('starships') }} as starships,
    {{ array_to_id('vehicles') }} as vehicles,
    {{ array_to_id('species') }} as species,
    created::timestamp as created_timestamp,
    edited::timestamp as edited_timestamp
  from source
)


select * from final

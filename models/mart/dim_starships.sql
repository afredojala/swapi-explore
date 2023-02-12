with source as (
  select
    *
  from {{ ref('stg_starships') }}
),

final as (
  select
    id,
    name,
    model,
    manufacturer,
    cost_in_credits,
    length,
    max_atmosphering_speed,
    crew,
    passengers,
    cargo_capacity,
    consumables,
    hyperdrive_rating,
    MGLT,
    starship_class
  from source
)

select * from final

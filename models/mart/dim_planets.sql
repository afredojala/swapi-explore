with source as (
  select
    *
  from {{ ref('stg_planets') }}
),

final as (
  select
    id,
    name,
    rotation_period,
    orbital_period,
    diameter,
    climate,
    gravity,
    surface_water,
    population
  from source
)

select * from final

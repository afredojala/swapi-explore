with source as (
  select
    *
  from {{ ref('stg_species' )}}
),

final as (
  select
    id,
    name,
    classification,
    designation,
    average_height,
    skin_colors,
    hair_colors,
    eye_colors,
    average_lifespan,
    homeworld,
    language
  from source
)

select * from final

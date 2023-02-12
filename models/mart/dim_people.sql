with source as (
  select
    *
  from {{ ref('stg_people') }}
),


final as (
  select
    id,
    name,
    height,
    mass,
    hair_color,
    skin_color,
    eye_color,
    gender,
    homeworld
  from source
)

select * from final

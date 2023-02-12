with source as (
  select
    *
  from {{ ref('raw_people') }}
),

final as (
  select
    {{ get_id('url') }} as id,
    name,
    {{ to_int('height') }} as height,
    {{ to_float('mass') }} as mass,
    hair_color,
    skin_color,
    eye_color,
    birth_year,
    gender,
    {{ get_id('homeworld') }} as homeworld,
    {{ array_to_id('films') }} as films,
    {{ array_to_id('species') }} as species,
    {{ array_to_id('vehicles') }} as vehicles,
    {{ array_to_id('starships') }} as starships,
    created::timestamp as created_timestamp,
    edited::timestamp as edited_timestamp
  from source  
)

select * from final

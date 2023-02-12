with source as (
  select
    *
  from {{ ref('raw_planets')}}
),

final as (
  select
    {{ get_id('url') }} as id,
    name,
    {{ to_int('rotation_period') }} as rotation_period,
    {{ to_int('orbital_period') }} as orbital_period,
    {{ to_int('diameter')}} as diameter,
    climate,
    gravity,
    terrain,
    surface_water,
    {{ to_int('population', 'bigint') }} as population,
    {{ array_to_id('residents') }} as residents,
    {{ array_to_id('films') }} as films,
    created::timestamp as created_timestamp,
    edited::timestamp as edited_timestamp
  from source
)

select * from final

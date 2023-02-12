with source as (
  select
    *
  from {{ ref('raw_species') }}
),

final as (
  select
    {{ get_id('url')}} as id,
    name,
    classification,
    designation,
    {{ to_int('average_height') }} as average_height,
    skin_colors,
    hair_colors,
    eye_colors,
    {{ to_int('average_lifespan') }} as average_lifespan,
    {{ get_id('homeworld') }} as homeworld,
    language,
    {{ array_to_id('people') }} as people,
    {{ array_to_id('films') }} as films,
    created::timestamp as created_timestamp,
    edited::timestamp as edited_timestamp
  from source
)

select * from final

with source as (
  select
    *
  from {{ ref('raw_starships') }}
),

final as (
  select
    {{ get_id('url') }} as id,
    name,
    model,
    manufacturer,
    {{ to_int('cost_in_credits', 'bigint') }} as cost_in_credits,
    {{ to_float('length') }} as length,
    {{ to_float("replace(max_atmosphering_speed, 'km', '')")}} as max_atmosphering_speed,
    crew,
    {{ to_int('passengers') }} as passengers,
    {{ to_int('cargo_capacity', 'bigint') }} as cargo_capacity,
    consumables,
    {{ to_float('hyperdrive_rating') }} as hyperdrive_rating,
    {{ to_int('MGLT') }} as MGLT,
    starship_class,
    {{ array_to_id('pilots') }} as pilots,
    {{ array_to_id('films')}} as films,
    created::timestamp as created_timestamp,
    edited::timestamp as edited_timestamp
  from source
)

select * from final

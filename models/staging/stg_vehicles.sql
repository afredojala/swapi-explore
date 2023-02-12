with source as (
  select
    *
  from {{ ref('raw_vehicles') }}
),

final as (
  select
    {{ get_id('url') }} as id,
    name,
    model,
    manufacturer,
    {{ to_int('cost_in_credits', 'bigint') }} as cost_in_credits,
    {{ to_float('length') }} as length,
    {{ to_int('max_atmosphering_speed') }} as max_atmosphering_speed,
    {{ to_int('crew') }} as crew,
    {{ to_int('passengers') }} as passengers,
    {{ to_int('cargo_capacity') }} as cargo_capacity,
    consumables,
    vehicle_class,
    {{ array_to_id('pilots') }} as pilots,
    {{ array_to_id('films') }} as films,
    created::timestamp as created_timestamp,
    edited::timestamp as edited_timestamp
  from source
)


select * from final

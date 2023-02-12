with source as (
  select
    id,
    characters
  from {{ ref('stg_films') }}
),

people as (
  select
    *
  from {{ ref('dim_people') }}
),

films as (
  select
    *
  from {{ ref('dim_films')}}
),

cross_product as (
  select
    source.id,
    unnest(source.characters) as character_id
  from source
),

person_info as (
  select
    cross_product.id,
    count(*) as nr_characters,
    avg(people.height) as average_height,
    avg(people.mass) as average_mass,
    count(distinct homeworld) as distinct_homeworlds,
    count(distinct hair_color) as distinct_hair_color,
    count(distinct skin_color) as distinct_skin_color
  from cross_product
  left join people on people.id = cross_product.character_id
  group by 1
)






select * from person_info





with source as (
    select *
    from {{ source('RAW_ADVENTURE_WORKS', 'person_countryregion') }}
),

country_regions as (
    select
        -- Primary Key
        countryregioncode as country_region_code,
        -- Region Properties
        name as country_region_name,
    from source
)
select * from country_regions
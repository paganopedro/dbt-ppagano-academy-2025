with source as (
    select *
    from {{ source('RAW_ADVENTURE_WORKS', 'person_stateprovince') }}
),

state_provinces as (
    select
        -- primary key
        stateprovinceid as state_province_id
        -- foreign keys
        , countryregioncode as country_region_code
        -- properties
        , name as state_province_name
    from source
)
select * from state_provinces
with source as (
    select *
    from {{ source('RAW_ADVENTURE_WORKS', 'person_address') }}
),

addresses as (
    select
        -- primary key
        addressid as address_id
        -- foreign keys
        , stateprovinceid as state_province_id
        -- properties
        , city as city_name
    from source   
)

select * from addresses
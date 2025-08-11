with source as (
    select *
    from {{ source('RAW_ADVENTURE_WORKS', 'sales_store') }}

),

stores as (
    select
        -- primary key
        businessentityid as store_id
        -- foreign keys
        , name as store_name
    from source
)
select * from stores
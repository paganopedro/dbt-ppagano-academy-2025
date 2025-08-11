with source as (
    select *
    from {{ source('RAW_ADVENTURE_WORKS', 'sales_salesorderheader') }}

),

status as (
    select
        -- primary key
        distinct status as status_id
    from source
)
select * from status
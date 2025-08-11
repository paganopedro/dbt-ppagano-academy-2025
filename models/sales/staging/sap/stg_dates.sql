with source as (
    select *
    from {{ source('RAW_ADVENTURE_WORKS', 'sales_salesorderheader') }}
), 

dates as (
    select
        -- primary key
        cast(orderdate as datetime) as order_date
    from source
   
)
select * from dates
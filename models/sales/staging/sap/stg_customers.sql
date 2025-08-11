with source as (
    select *
    from {{ source('RAW_ADVENTURE_WORKS', 'sales_customer') }}
),

customers as (
    select
        -- Primary Key
        customerid as customer_id,        
        -- Foreign Keys
        personid as person_id,
        storeid as store_id,        
    from source
)
select * from customers
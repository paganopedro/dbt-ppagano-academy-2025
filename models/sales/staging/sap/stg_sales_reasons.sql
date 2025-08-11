with source as (
    select *
    from {{ source('RAW_ADVENTURE_WORKS', 'sales_salesreason') }}
),
sales_reasons as (
    select
        -- primary key
        salesreasonid as sales_reason_id
        -- properties
        , name as sales_reason
    from source
)
select * from sales_reasons
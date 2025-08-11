with source as (
    select *
    from {{ source('RAW_ADVENTURE_WORKS', 'sales_salesorderheader') }}
),

sales_order_headers as (
    select
        -- primary key
        salesorderid as sales_order_id
        -- foreign keys
        , customerid as customer_id
        , creditcardid as credit_card_id
        , shiptoaddressid as ship_to_address_id
        , status as status_id
        , cast(orderdate as datetime) as order_date
        -- properties
        , subtotal as order_subtotal
    from source
)
select * from sales_order_headers
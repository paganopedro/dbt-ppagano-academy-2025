with source as (
    select *
    from {{ source('RAW_ADVENTURE_WORKS', 'sales_salesorderdetail') }}
),

sales_order_details as (
    select
        -- primary key
        salesorderdetailid as sales_order_detail_id
        -- foreign keys
        , salesorderid as sales_order_id
        , productid as product_id
        -- costs and quantities
        , orderqty as order_quantity
        , unitprice as unit_price
        , unitpricediscount as unit_price_discount
    from source
)
select * from sales_order_details
with src_sales_order_headers as (
    select *
    from {{ ref('stg_sales_order_headers') }}
),

src_sales_order_details as (
    select *
    from {{ ref('stg_sales_order_details') }}
),

assembled_orders as (
    select
        src_sales_order_headers.status_id,
        src_sales_order_headers.order_date,
        src_sales_order_headers.customer_id,
        src_sales_order_headers.sales_order_id,
        src_sales_order_headers.credit_card_id,
        src_sales_order_headers.order_subtotal,
        src_sales_order_headers.ship_to_address_id,
        src_sales_order_details.unit_price,
        src_sales_order_details.product_id,
        src_sales_order_details.order_quantity,
        src_sales_order_details.unit_price_discount,
        src_sales_order_details.sales_order_detail_id,
        src_sales_order_details.unit_price * src_sales_order_details.order_quantity as gross_sales,
        src_sales_order_details.unit_price * src_sales_order_details.order_quantity - (1 - src_sales_order_details.unit_price_discount) as net_sales
    from src_sales_order_headers
    inner join src_sales_order_details
        on src_sales_order_headers.sales_order_id = src_sales_order_details.sales_order_id
)

select *
from assembled_orders
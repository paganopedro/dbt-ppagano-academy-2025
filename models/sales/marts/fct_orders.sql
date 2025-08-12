with src_orders as (
    select *
    from {{ ref('int_orders') }}
),

enriched_orders as (
    select
        -- Generate composite surrogate key for fact table
        {{ dbt_utils.generate_surrogate_key(['src_orders.sales_order_id', 'sales_order_detail_id']) }} as sales_order_sk,

        -- Generate foreign key surrogate keys for dimension relationships
        {{ dbt_utils.generate_surrogate_key(['status_id']) }} as status_sk,
        {{ dbt_utils.generate_surrogate_key(['product_id']) }} as product_sk,
        {{ dbt_utils.generate_surrogate_key(['customer_id']) }} as customer_sk,
        {{ dbt_utils.generate_surrogate_key(['order_date']) }} as order_date_sk,
        {{ dbt_utils.generate_surrogate_key(['credit_card_id']) }} as credit_card_sk,
        {{ dbt_utils.generate_surrogate_key(['ship_to_address_id']) }} as ship_address_sk,

        *
    from src_orders
)

select *
from enriched_orders
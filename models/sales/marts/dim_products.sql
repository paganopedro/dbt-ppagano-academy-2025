with src_products as (
    select *
    from {{ ref('int_products') }}
),

enriched_products as (
    select
        -- Generate surrogate key for dimension table
        {{ dbt_utils.generate_surrogate_key(['src_products.product_id']) }} as product_sk,
        *
    from src_products
)

select *
from enriched_products;
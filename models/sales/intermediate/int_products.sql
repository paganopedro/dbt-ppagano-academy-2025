with src_products as (
    select *
    from {{ ref('stg_products') }}
),

src_product_subcategories as (
    select *
    from {{ ref('stg_product_subcategories') }}
),

src_product_categories as (
    select *
    from {{ ref('stg_product_categories') }}
),

assembled_products as (
    select
        src_products.product_id,
        src_products.product_name,
        src_product_categories.product_category_id,
        src_product_categories.product_category_name,
        src_product_subcategories.product_subcategory_id,
        src_product_subcategories.product_subcategory_name
    from src_products
    left join src_product_subcategories
        on src_products.product_subcategory_id = src_product_subcategories.product_subcategory_id
    left join src_product_categories
        on src_product_subcategories.product_category_id = src_product_categories.product_category_id
)

select *
from assembled_products
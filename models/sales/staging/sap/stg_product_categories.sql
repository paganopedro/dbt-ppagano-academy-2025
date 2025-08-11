with source as (
    select *
    from {{ source('RAW_ADVENTURE_WORKS', 'production_productcategory') }}
),

product_categories as (
    select
        -- primary key
        productcategoryid as product_category_id
        -- properties
        , name as product_category_name
    from source
)
select * from product_categories
with source as (
    select *
    from {{ source('RAW_ADVENTURE_WORKS', 'production_product') }}
),

products as (
    select
        -- primary key
        productid as product_id
        -- foreign keys
        , productsubcategoryid as product_subcategory_id
        -- properties
        , name as product_name
    from source
)
select * from products
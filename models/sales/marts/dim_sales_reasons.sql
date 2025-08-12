with src_sales_reasons as (
    select *
    from {{ ref('int_sales_reasons') }}
),

enriched_sales_reasons as (
    select
        -- Generate surrogate key for dimension table
        {{ dbt_utils.generate_surrogate_key(['src_sales_reasons.sales_order_id']) }} as sales_reason_sk,
        *
    from src_sales_reasons
)

select *
from enriched_sales_reasons
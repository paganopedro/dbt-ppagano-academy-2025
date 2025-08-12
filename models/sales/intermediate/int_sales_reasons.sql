with src_sales_reasons as (
    select *
    from {{ ref('stg_sales_reasons') }}
),

src_header_reasons as (
    select *
    from {{ ref('stg_sales_order_header_sales_reasons') }}
),

assembled_reasons as (
    select
        src_header_reasons.sales_order_id,
        src_sales_reasons.sales_reason_id,
        coalesce(src_sales_reasons.sales_reason, 'Unknown reason') as sales_reason
    from src_header_reasons
    left join src_sales_reasons
        on src_header_reasons.sales_reason_id = src_sales_reasons.sales_reason_id
)

select *
from assembled_reasons;
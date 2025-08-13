with src_dates as (
    select *
    from {{ ref('int_dates') }}
),

enriched_dates as (
    select
        -- Generate surrogate key for dimension table using the full order_date
        {{ dbt_utils.generate_surrogate_key(['src_dates.order_date']) }} as date_sk,
        *
    from src_dates
)

select *
from enriched_dates
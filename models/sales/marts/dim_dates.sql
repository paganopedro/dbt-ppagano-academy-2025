with src_dates as (
    select *
    from {{ ref('int_dates') }}
),

enriched_dates as (
    select
        -- Generate surrogate key for dimension table
        {{ dbt_utils.generate_surrogate_key(['src_dates.order_day']) }} as date_sk,
        *
    from src_dates
)

select *
from enriched_dates
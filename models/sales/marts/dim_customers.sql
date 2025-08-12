
with src_customers as (
    select *
    from {{ ref('int_customers') }}
),

enriched_customers as (
    select
        -- Generate surrogate key for dimension table
        {{ dbt_utils.generate_surrogate_key(['src_customers.customer_id']) }} as customer_sk,
        *
    from src_customers
)

select *
from enriched_customers;
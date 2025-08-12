-- Check if the total gross sales for 2011 match the expected amount.
-- The validation uses a small tolerance to avoid failures caused by 
-- minor floating-point rounding differences.

with yearly_sales as (
    select
        cast(sum(gross_sales) as float64) as total_sales
    from {{ ref('fct_orders') }}
    where extract(year from order_date) = 2011
)

select *
from yearly_sales
where abs(total_sales - 12646112.16) <= 0.0001

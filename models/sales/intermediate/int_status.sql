with src_status as (
    select *
    from {{ ref('stg_status') }}
),

status_mapped as (
    select
        status_id,
        case
            when status_id = 1 then 'in_process'
            when status_id = 2 then 'approved'
            when status_id = 3 then 'backordered'
            when status_id = 4 then 'rejected'
            when status_id = 5 then 'shipped'
            when status_id = 6 then 'cancelled'
            else 'no_status'
        end as order_status
    from src_status
)

select *
from status_mapped
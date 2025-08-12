with src_status as (
    select *
    from {{ ref('int_status') }}
),

enriched_status as (
    select
        -- Generate surrogate key for dimension table
        {{ dbt_utils.generate_surrogate_key(['src_status.status_id']) }} as status_sk,
        *
    from src_status
)

select *
from enriched_status
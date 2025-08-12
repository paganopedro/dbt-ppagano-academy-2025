with src_addresses as (
    select *
    from {{ ref('int_addresses') }}
),

enriched_addresses as (
    select
        {{ dbt_utils.generate_surrogate_key(['src_addresses.address_id']) }} as address_sk,
        *
    from src_addresses
)

select *
from enriched_addresses;
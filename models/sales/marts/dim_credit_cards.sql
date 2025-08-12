with src_credit_cards as (
    select *
    from {{ ref('stg_credit_cards') }}
),

enriched_credit_cards as (
    select
        -- Generate surrogate key for dimension table
        {{ dbt_utils.generate_surrogate_key(['src_credit_cards.credit_card_id']) }} as credit_card_sk,
        *
    from src_credit_cards
)

select *
from enriched_credit_cards;
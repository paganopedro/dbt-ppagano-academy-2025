with source as (
    select *
    from {{ source('RAW_ADVENTURE_WORKS', 'sales_creditcard') }}
),

credit_cards as (
    select
        -- Primary Key
        creditcardid as credit_card_id,        
        -- Card Properties
        cardtype as card_type,        
    from source
)
select * from credit_cards
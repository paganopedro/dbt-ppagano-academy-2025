with src_customers as (
    select *
    from {{ ref('stg_customers') }}
),

src_stores as (
    select *
    from {{ ref('stg_stores') }}
),

src_people as (
    select *
    from {{ ref('stg_people') }}
),

assembled_customers as (
    select
        src_stores.store_id,
        src_people.person_id,
        src_customers.customer_id,
        case
            when src_people.person_type_id = 'EM' then 'Employee'
            when src_people.person_type_id = 'SP' then 'Sales Person'
            when src_people.person_type_id = 'SC' then 'Store Contact'
            when src_people.person_type_id = 'VC' then 'Vendor Contact'
            when src_people.person_type_id = 'GC' then 'General Contact'
            when src_people.person_type_id = 'IN' then 'Individual Customer'
        end as person_type,
        coalesce(src_people.full_name, 'unregistered customer') as full_name,
        src_stores.store_name
    from src_customers
    left join src_people
        on src_customers.person_id = src_people.person_id
    left join src_stores
        on src_customers.store_id = src_stores.store_id
)

select *
from assembled_customers
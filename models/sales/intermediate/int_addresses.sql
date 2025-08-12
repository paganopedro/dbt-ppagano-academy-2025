with src_addresses as (
    select *
    from {{ ref('stg_addresses') }}
),

src_country_regions as (
    select *
    from {{ ref('stg_country_regions') }}
),

src_state_provinces as (
    select *
    from {{ ref('stg_state_provinces') }}
),

assembled_addresses as (
    select
        -- source primary key
        src_addresses.address_id,
        src_country_regions.country_region_code,
        src_state_provinces.state_province_id,
        src_addresses.city_name,
        src_country_regions.country_region_name,
        src_state_provinces.state_province_name
    from src_addresses
    left join src_state_provinces
        on src_addresses.state_province_id = src_state_provinces.state_province_id
    left join src_country_regions
        on src_state_provinces.country_region_code = src_country_regions.country_region_code
)

select *
from assembled_addresses
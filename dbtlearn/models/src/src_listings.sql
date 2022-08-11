{{
    config(
        materialized="ephemeral",
    )
}}

with
    listings as (select * from {{ source("airbnb", "listings") }}),

    final as (
        select
            id as listing_id,
            name as listing_name,
            listing_url as listing_url,
            room_type as room_type,
            minimum_nights as minimum_nights,
            host_id as host_id,
            price as price_str,
            created_at as created_at,
            updated_at as updated_at
        from listings
    )

select *
from final

{{
    config(
        materialized="ephemeral",
    )
}}

with
    reviews as (select * from {{ source("airbnb", "reviews") }}),

    final as (
        select
            listing_id as listing_id,
            date as review_date,
            reviewer_name as reviewer_name,
            comments as review_text,
            sentiment as review_sentiment
        from reviews
    )

select *
from final

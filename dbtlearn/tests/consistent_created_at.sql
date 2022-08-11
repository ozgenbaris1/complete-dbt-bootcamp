with
    dim_listings_cleansed as (select * from {{ ref("dim_listings_cleansed") }}),

    fct_reviews as (select * from {{ ref("fct_reviews") }})


select *
from fct_reviews
left join dim_listings_cleansed using(listing_id)
where review_date < created_at
limit 1

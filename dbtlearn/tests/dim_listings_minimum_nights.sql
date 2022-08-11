with dim_listings_cleansed as (select * from {{ ref("dim_listings_cleansed") }})

select *
from dim_listings_cleansed
where minimum_nights < 1
limit 1

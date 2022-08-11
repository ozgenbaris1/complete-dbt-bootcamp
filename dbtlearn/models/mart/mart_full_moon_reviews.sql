{{
    config(
        materialized="table",
    )
}}
with
    fct_reviews as (select * from {{ ref("fct_reviews") }}),

    full_moon_dates as (select * from {{ ref("seed_full_moon_dates") }}),

    final as (
        select
            fr.*,
            case
                when fmd.full_moon_date is null then false else true
            end as is_full_moon
        from fct_reviews fr
        left join
            full_moon_dates fmd on to_date(fr.review_date) = dateadd(
                day, 1, fmd.full_moon_date
            )
    )

select *
from final

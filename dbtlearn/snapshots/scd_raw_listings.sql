{% snapshot scd_raw_listings %}

{{
    config(
        target_schema="airbnb_dev",
        unique_key="id",
        strategy="timestamp",
        updated_at="updated_at",
        invalidate_hard_deletes=True,
    )
}}

with listings as (select * from {{ source("airbnb", "listings") }})

select *
from listings



{% endsnapshot %}

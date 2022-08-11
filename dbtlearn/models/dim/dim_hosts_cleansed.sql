{{
    config(
        materialized="view",
    )
}}

with
    src_hosts as (select * from {{ ref("src_hosts") }}),

    hosts as (select * from src_hosts),

    final as (
        select
            host_id as host_id,
            nvl(host_name, 'Anonymous') as host_name,
            is_superhost as is_superhost,
            created_at as created_at,
            updated_at as updated_at
        from hosts
    )

select *
from final

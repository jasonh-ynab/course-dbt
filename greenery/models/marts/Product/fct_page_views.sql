
-- UNFINISHED DRAFT 

with
pageviews as (
    select * from {{ ref('int_page_views')}}
),

sessions as (
    select * from {{ ref('int_sessions')}}
),

final as (
    select 
        *
    from pageviews
)

select * from final

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
--
-- final as (
--    select
--      date(events.event_created_at_utc) as date
--      , events.product_id
--      , events.session_id
--      , events.user_id
--      , case
--          when concat(events.session_id,events.product_id)
--            = concat(session_order_purchases.session_id,session_order_purchases.product_id) then 1
--          else 0
--        end as end_in_purchase
--    from events
--    left join
--      session_order_purchases on
--      events.session_id =
--      session_order_purchases.session_id
--    where event_type = 'checkout'
--)
--
select * from final
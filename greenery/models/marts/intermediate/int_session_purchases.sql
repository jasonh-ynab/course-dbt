{{
  config(
    materialized='table'
  )
}}

with
events as (
    select * from {{ ref('stg_postgres__events')}}
),

order_items as (select * from {{ ref('stg_postgres__order_items')}}
),

session_order_purchases as (
    select
        events.session_id
        , events.user_id
        , events.order_id
        , order_items.product_id
    from events
    left join 
        order_items on
        events.order_id
        = order_items.order_id
    where events.event_type = 'checkout'
    group by 1,2,3,4
),


final as (
    select
      date(events.event_created_at_utc) as date
      , events.product_id
      , events.session_id
      , events.user_id
      , case
          when concat(events.session_id,events.product_id)
            = concat(session_order_purchases.session_id,session_order_purchases.product_id) then 1
          else 0
        end as end_in_purchase
    from events
    left join
      session_order_purchases on
      events.session_id =
      session_order_purchases.session_id
    where event_type = 'checkout'
)

select * from final
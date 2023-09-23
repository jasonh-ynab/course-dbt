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

session_purchases as (
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

select * from session_purchases
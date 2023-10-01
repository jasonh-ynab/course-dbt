{{
  config(
    materialized='table'
  )
}}

with
events as (
    select * from {{ ref('stg_postgres__events')}}
),

order_items as (
    select * from {{ ref('stg_postgres__order_items')}}
),

final as (
    select
      e.session_id
      , e.user_id
      , coalesce(e.product_id,oi.product_id) as product_id
      {{event_types('stg_postgres__events','event_type') }}
    from events e
      left join order_items oi
      on e.order_id = oi.order_id
    group by 1,2,3
)

select * from final
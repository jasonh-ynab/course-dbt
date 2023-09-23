{{
  config(
    materialized='table'
  )
}}

with
events as (
    select * from {{ ref('stg_postgres__events')}}
),

final as (
    select
        date(event_created_at_utc) as date
        , product_id
        , session_id
        , user_id
    from events
    where event_type = 'page_view'
)

select * from final
with
source as (
    select * from {{ source('postgres', 'events')}}
),

renamed_recast as (
    SELECT
      event_id,
      session_id,
      user_id,
      page_url,
      created_at as event_created_at_utc,
      event_type,
      order_id,
      product_id
    from source
)

select * from renamed_recast
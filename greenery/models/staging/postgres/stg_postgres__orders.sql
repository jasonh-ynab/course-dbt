with
source as (
    select * from {{ source('postgres', 'orders')}}
),

renamed_recast as (
    SELECT
      order_id,
      user_id,
      promo_id,
      address_id,
      created_at as order_created_at_utc,
      order_cost,
      shipping_cost,
      order_total,
      tracking_id,
      shipping_service,
      estimated_delivery_at,
      delivered_at as delivered_at_utc,
      status as order_status
    from source
)

select * from renamed_recast
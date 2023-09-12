{{
  config(
    materialized='table'
  )
}}

SELECT
  order_id,-- VARCHAR(256) PRIMARY KEY,
  user_id,-- VARCHAR(256) REFERENCES users(user_id),
  promo_id,-- VARCHAR(256) REFERENCES promos(promo_id),
  address_id,-- VARCHAR(256) REFERENCES addresses(address_id),
  created_at,-- TIMESTAMP,
  order_cost,-- REAL,
  shipping_cost,-- REAL,
  order_total,-- REAL,
  tracking_id,-- VARCHAR(256),
  shipping_service,-- VARCHAR(128),
  estimated_delivery_at,-- TIMESTAMP,
  delivered_at,-- TIMESTAMP,
  status-- VARCHAR(128)
FROM {{ source('postgres', 'orders') }}
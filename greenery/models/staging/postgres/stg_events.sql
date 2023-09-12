{{
  config(
    materialized='table'
  )
}}

SELECT
  event_id,-- VARCHAR(256),
  session_id,-- VARCHAR(256),
  user_id,-- VARCHAR(256) REFERENCES users(user_id),
  page_url,-- VARCHAR(4096),
  created_at,-- TIMESTAMP,
  event_type,-- VARCHAR(128),
  order_id,-- VARCHAR(256) REFERENCES orders(order_id),
  product_id-- VARCHAR(256) REFERENCES products(product_id)
FROM {{ source('postgres', 'events') }}
{{
  config(
    materialized='table'
  )
}}

SELECT
  order_id,-- VARCHAR(256) REFERENCES orders(order_id),
  product_id,-- VARCHAR(256) REFERENCES products(product_id),
  quantity-- INTEGER,
  --PRIMARY KEY(order_id, product_id)
FROM {{ source('postgres', 'order_items') }}
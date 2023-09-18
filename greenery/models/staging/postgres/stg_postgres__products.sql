with
source as (
    select * from {{ source('postgres', 'products')}}
),

renamed_recast as (
    SELECT
      product_id,
      name as product_name,
      price,
      inventory
    from source
)

select * from renamed_recast
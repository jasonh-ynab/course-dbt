with order_sizes as (
    select * from {{ref ('stg_postgres__order_items')}}
),

final as (
    select
        order_id
        , count (distinct product_id) as products_in_order
        , sum (quantity) as basket_size
    from order_sizes
    group by 1
)

select * from final
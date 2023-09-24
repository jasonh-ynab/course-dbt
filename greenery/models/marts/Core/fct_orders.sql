with orders as (
    select * from {{ ref('stg_postgres__orders')}}
),

order_sizes as (
    select * from {{ ref('int_order_sizes')}}
),

address as (
    select * from {{ ref('stg_postgres__addresses')}}
),

final as (
    select 
        o.order_id
        , o.user_id
        , o.promo_id
        , o.address_id
        , a.state
        , a.country
        , date(o.order_created_at_utc) as order_date
        , o.order_cost
        , o.shipping_cost
        , o.order_total
        , o.tracking_id
        , o.shipping_service
        , o.estimated_delivery_at
        , date(o.delivered_at_utc) as delivery_date
        , o.order_status
        , os.products_in_order
        , os.basket_size
    from orders o
    left join order_sizes os
        on o.order_id = os.order_id
    left join address a 
        on o.address_id = a.address_id
)

select * from final
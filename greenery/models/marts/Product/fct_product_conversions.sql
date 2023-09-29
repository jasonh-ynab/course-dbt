with sessions as (
    select * from {{ ref('int_sessions')}}
),

products as (
    select * from {{ ref('stg_postgres__products')}}
),

final as (
    select 
        distinct(se.product_id)
        , p.product_name
        , p.product_price
        , count(distinct (se.session_id))                      as sessions
        , sum(case when se.checkouts >= 1 then 1 else 0 end)   as conversions
        , (conversions / sessions)*100                         as conversion_rate
        -- I can see that this calculation is not correct, but I don't know WHY - nor how to fix it...
    from sessions se
    left join products p
        on se.product_id = p.product_id
    group by all
)

select * from final
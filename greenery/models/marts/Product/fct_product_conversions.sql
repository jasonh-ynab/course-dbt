with sessions as (
    select * from {{ ref('int_sessions')}}
),

final as (
    select 
        distinct(product_id)
        , count(distinct (session_id))                      as sessions
        , sum(case when checkouts >= 1 then 1 else 0 end)   as conversions
        , (conversions / sessions)                          as conversion_rate
    from sessions
    group by all
)

select * from final
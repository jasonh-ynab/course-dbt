# Analytics engineering with dbt | Week 1 Project - Jason Lambeth Hill

## How many users do we have? 
  ### --> 130 distinct users
SELECT 
    count(distinct(user_id))
FROM stg_users
;
-- On average, how many orders do we receive per hour? 
    --> 7.5 orders per hour, on average
SELECT
    avg(orders_per_hour)
FROM 
    (SELECT
        count(distinct(order_id)) as orders_per_hour,
        date_trunc('hour',created_at) as date_hourly_group
    FROM stg_orders
    group by date_hourly_group)
;
## On average, how long does an order take from being placed to being delivered? 
  ### --> ~93 hours, or 3-4 days
SELECT 
    avg(datediff(hour,created_at,delivered_at)) as fulfillment_time
FROM stg_orders
where delivered_at is not null
;
# How many users have only made one purchase? Two purchases? Three+ purchases?
####    -- Note: you should consider a purchase to be a single 
####        -- order. In other words, if a user places one order for 3 
####        -- products, they are considered to have made 1 purchase.
  ### --> 25 users made one purchase, 28 users made two purchases, & 71 users made three or more purchases.
SELECT
    CASE WHEN lifetime_orders = 1 then 'one'
        WHEN lifetime_orders = 2 then 'two'
        else 'over three'
    END as repeat_purchase_buckets,
    count(distinct(user_id)) total_users
FROM
    (SELECT 
        count(distinct(order_id)) lifetime_orders,
        user_id
    FROM stg_orders
    group by user_id)
group by repeat_purchase_buckets
order by total_users asc
;

## On average, how many unique sessions do we have per hour? 
  ### --> 16.3 sessions per hour, on average

SELECT
    avg(sessions_per_hour)
FROM
    (SELECT 
        count(distinct(session_id)) as sessions_per_hour,
        date_trunc('hour',created_at) as date_hourly_group
    FROM stg_events
        group by date_hourly_group)
limit 20
;

## License
GPL-3.0

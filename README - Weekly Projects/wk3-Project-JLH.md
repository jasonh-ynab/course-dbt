# Analytics engineering with dbt | Week 3 - Jason Lambeth Hill

## Part 1 | Create new models...
I built ```fct_product_conversions```, which makes these 2 questions extremely easy to look at -- simply dividing the sum of conversions by the sum of sessions.

```sql
select 
    sum(conversions)/sum(sessions) as Conversion_Rate
from fct_product_conversions
;
```
```sql
select 
    product_name
    , sum(conversions)/sum(sessions) as Conversion_Rate
from fct_product_conversions
group by all
;
```

## Part 2 | macros...
I did the simple event_type column macro.

## Part 3 | granting permissions...
Done. And it looks like it ran in Snowflake "Activity" bar.

## Part 4 | dbt packages...
Done. 

## Part 5 | show it off...

#### Question: 

#### Answer: 

#### Tasks: 



## License
GPL-3.0

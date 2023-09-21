# Analytics engineering with dbt | Week 2 Project - Jason Lambeth Hill

#### Question: 
What is our user repeat rate? 
####    Answer: 
80% - It's a small set of ~124 total purchasers.

```
select
    (count_if(order_number >= 2) / count(distinct user_id )) as Repeat_Rate
from
    (select
        count(distinct order_id) as order_number,
        user_id
    from stg_orders
    group by user_id) 
;
```

#### Question: 
HYPOTHETICAL: What are good indicators of a user who will likely purchase again? What about indicators of users who are likely NOT to purchase again? If you had more data, what features would you want to look into to answer this question?
#### Answer
We have lots of pathways here. One short-term play is: we could look at the `events` table and see if there are users visiting the site or even adding to cart without having completed a recent purchase.

More in the line of correlating, we might look at repeat purchasers and try to find some trends in how they buy & what products they buy. We'd find this in `orders` and `order_items` What is their average cart size? What products are they buying -- and are those products repeat purchased or complementary to another product? 

I would want to see if `promo` code usage relates to repeat purchases -- whether the promo code is more commonly used in the first purchase or in a subsequent purchase. I would also want to consider seasonality. Perhaps December purchases repeat more often due to gifting.

Lastly, we might look at `addresses` to see if there is any sort of geographic trend.

Beyond the data that we have, I would be interested in how a purchaser came to Greenery -- be it a referral or a marketing effort. Marketing & sales channels likely draw in different customer segments with distinct purchasing patterns, so I'd love to track that through UTM tracking and/or surveys. 

There's more to dig into & dream about, but this feels like a very dense starting point!

#### Tasks: 
-> More stakeholders are coming to us for data, which is great! But we need to get some more models created before we can help. Create a marts folder, so we can organize our models, with the following subfolders for business units:

• Product -- required

• Core -- optional

• Marketing -- optional 

-> Within each marts folder, create intermediate models and dimension/fact models.




## License
GPL-3.0

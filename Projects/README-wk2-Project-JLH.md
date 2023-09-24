# Analytics engineering with dbt | Week 2 Project - Jason Lambeth Hill

## Part 1 | Models

#### Question: 
What is our user repeat rate? 
####    Answer: 
80% - It's a small set of ~124 total purchasers. I only had time to play with the SQL, but I'm interested in thinking about how I would surface this in a fact table...

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

#### Question & tasks: 
Explain the product mart models you added. Why did you organize the models in the way you did? (Use the dbt docs to visualize your model DAGs to ensure the model layers make sense -- paste an imagine of your DAG)
#### Answer
For the Product Mart, I needed 2 intermediate tables to get me to the "final" ```fct_page_views``` table. I like how Jake H. talked about intermediate tables being a 'bit of code that you can re-use elsewhere.' So the 2 tables feel like they could 'plug in' in 2 very different ways.
First, ```int_sessions``` fully transforms the ```stg_events``` table into a by session, by user, by page/product table that aggregates our trigger events. 
Second, ```int_session_times``` simply takes the timestamps related to each session to give a bit more usable context (e.g. session length).

In terms of organization, I decided to leave the intermediate folder outside of Product & keep it in marts because it feels as if these int tables could be repurposed for other teams (e.g. Marketing may like to leverage some of the events website data).

[paste DAG]
<img width="1855" alt="image" src="https://github.com/jasonh-ynab/course-dbt/assets/105445369/ef290468-f57d-423a-ada4-2f37396e0bea">


## Part 2 | Tests

#### Question
What assumptions are you making about each model? (i.e. why are you adding each test?)
#### Answer
Across the board, I put in a unique test for the "primary key" of each table. I also put a test for address_id to not be null in the ```stg_addresses``` table.
My favorite test that I added is the accepted values on order_status in the ```stg_orders``` table.

#### Question
Did you find any “bad” data as you added and ran tests on your models? How did you go about either cleaning the data in the dbt model or adjusting your assumptions/tests?
#### Answer
I did not find any bad data...

#### Task
Apply these changes to your github repo

#### Question
Your stakeholders at Greenery want to understand the state of the data each day. Explain how you would ensure these tests are passing regularly and how you would alert stakeholders about bad data getting through.
#### Answer


## License
GPL-3.0

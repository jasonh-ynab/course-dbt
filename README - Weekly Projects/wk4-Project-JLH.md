# Analytics engineering with dbt | Week 3 - Jason Lambeth Hill

Here is a link to my Data Model folder structures: https://github.com/jasonh-ynab/course-dbt/tree/main/greenery/models/marts

## Part 1 | dbt Snapshots
• I ran ```dbt snapshot```
• Queried Snowflake, and see...

## Part 2 | Modeling challenge
• I didn't need to create any additional models, because my ```fct_page_views``` has everything I need.
• Namely: unique sessions, add to carts, & checkouts.
• It's also important to have the session_start_time so that we can build dashboards that filter time ranges or compare data over time.
• I also created an ```exposures.yml``` file coming 'out' of that table.

## Part 3 | Reflection questions
### 3A. dbt next steps for you 
Oh, I'm already taking so much of this. The work from weeks 1 & 2 is already directly transferable to a request coming in from our email marketing team -- I am going to refactor this ugly, unclean table that we're pushing to our data viz tool & create 2 or 3 new fact tables with this data, push it into our data viz, & create a few dashboards for them.

I'm also going to use a lot of this to set up a data pipeline for marketing team data.

Finally, I don't believe that we're utilizing exposures, but I do notice that dashboards get broken in our data viz tool. I think that bringing this to our Data Team & trying to integrate it into our DWH process could prevent future breaking of dashboards!


## License
GPL-3.0

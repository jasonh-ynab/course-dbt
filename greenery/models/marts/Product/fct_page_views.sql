with session_times as (
    select * from {{ ref('int_session_times')}}
),

sessions as (
    select * from {{ ref('int_sessions')}}
),

final as (
    select 
        se.session_id
        , se.user_id
        , se.product_id
        , se.page_views
        , se.add_to_carts
        , se.checkouts
        , se.packages_shipped
        , st.first_session_event_at_utc
        , st.last_session_event_at_utc
        , st.session_length_minutes
    from sessions se
    left join session_times st 
        on se.session_id = st.session_id
)

select * from final
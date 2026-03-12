with cte as (
    select 
    to_timestamp(STARTED_AT) as STARTED_AT,
    date(started_at) as date_started_at,
    hour(to_timestamp(STARTED_AT)) as hour_started_at,
    

    case
    when dayname(to_timestamp(STARTED_AT)) in ('sat','sun')
    then 'weekend'
    else 'businessday'
    end as day_type,

    case 
    when month(to_timestamp(STARTED_AT)) in (12,1,2)
    then 'winter'
    when month(to_timestamp(STARTED_AT)) in (3,4,5)
    then 'spring'
    when month(to_timestamp(STARTED_AT)) in (6,7,8)
    then 'summer'
    else 'autumn'
    end as year_season 
    from {{ source('demo', 'bike') }}
    where STARTED_AT != 'started_at'
)

select * from cte
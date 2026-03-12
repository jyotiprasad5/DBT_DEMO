with cte as (
    select 
    to_timestamp(STARTED_AT) as STARTED_AT,
    date(started_at) as date_started_at,
    hour(to_timestamp(STARTED_AT)) as hour_started_at,
    
    {{ day('STARTED_AT') }},
    {{ function1('STARTED_AT') }},
    {{ season('STARTED_AT') }}

    from {{ source('demo', 'bike') }}
    where STARTED_AT != 'started_at'
)


select * from cte
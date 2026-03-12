with daily_weather as (

    select * from 
    {{ source('demo', 'WEATHERTABLE') }}
    limit 10
)


select * from daily_weather 
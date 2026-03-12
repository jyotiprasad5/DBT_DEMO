with bike as (
    select
    START_STATIO_ID,
    START_STATION_NAME,
    START_LAT,
    START_LNG
    
    from {{ source('demo', 'bike') }}
    --where ride_id != 'RIDE_ID'
    limit 10
)

select * from bike

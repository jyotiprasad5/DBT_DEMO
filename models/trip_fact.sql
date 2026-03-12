with trips as (
    select
    RIDE_ID,
    RIDEABLE_TYPE,
    date(to_timestamp(STARTED_AT)) as trip_date,
    START_STATIO_ID as START_STATION_ID,
    END_STATION_ID as END_STATION_ID,
    MEMBER_CSUAL as MEMBER_CASUAL,
    --to_timestamp(ENDED_AT)-to_timestamp(STARTED_AT)
    timestampdiff(seconds,to_timestamp(ENDED_AT),to_timestamp(STARTED_AT)) as trip_duration_seconds
    from {{ source('demo', 'bike') }}
    --where ride_id != 'RIDE_ID'
    limit 10
)

select * from trips

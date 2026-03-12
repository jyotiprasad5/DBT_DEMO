{% macro function1 (x) %}
case when to_timestamp({{ x }}) < current_date
then 'past'
else 'future'
end as statuscheck 
{% endmacro %}



{% macro season (x) %}
case 
    when month(to_timestamp({{ x }})) in (12,1,2)
    then 'winter'
    when month(to_timestamp({{ x }}))in (3,4,5)
    then 'spring'
    when month(to_timestamp({{ x }})) in (6,7,8)
    then 'summer'
    else 'autumn'
    end as year_season
{% endmacro %}

{% macro day (x) %}
case
    when dayname(to_timestamp({{x}})) in ('Sat','Sun')
    then 'weekend'
    else 'businessday'
    end as day_type
{% endmacro %}
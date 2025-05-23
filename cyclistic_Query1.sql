create database cyclistic_project;
use cyclistic_project;
select ride_id,
rideable_type,
started_at,
ended_at,
start_station_name,
end_station_name,
member_casual
from dbo.[jan_tripdata]
union all
select ride_id,
rideable_type,
started_at,
ended_at,
start_station_name,
end_station_name,
member_casual
from dbo.[feb_tripdata]
union all
select ride_id,
rideable_type,
started_at,
ended_at,
start_station_name,
end_station_name,
member_casual
from dbo.[mar_tripdata]
union all
select ride_id,
rideable_type,
started_at,
ended_at,
start_station_name,
end_station_name,
member_casual
from dbo.[apr_tripdata]
union all 
select ride_id,
rideable_type,
started_at,
ended_at,
start_station_name,
end_station_name,
member_casual
from dbo.[may_tripdata]
union all
select ride_id,
rideable_type,
started_at,
ended_at,
start_station_name,
end_station_name,
member_casual
from dbo.[jun_tripdata]
union all
select ride_id,
rideable_type,
started_at,
ended_at,
start_station_name,
end_station_name,
member_casual
from dbo.[jul_tripdata]
union all
select ride_id,
rideable_type,
started_at,
ended_at,
start_station_name,
end_station_name,
member_casual
from dbo.[aug_tripdata]
union all
select ride_id,
rideable_type,
started_at,
ended_at,
start_station_name,
end_station_name,
member_casual
from dbo.[sep_tripdata]
union all
select ride_id,
rideable_type,
started_at,
ended_at,
start_station_name,
end_station_name,
member_casual
from dbo.[oct_tripdata]
union all 
select ride_id,
rideable_type,
started_at,
ended_at,
start_station_name,
end_station_name,
member_casual
from dbo.[nov_tripdata]
union all
select ride_id,
rideable_type,
started_at,
ended_at,
start_station_name,
end_station_name,
member_casual
from dbo.[dec_tripdata];
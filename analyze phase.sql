select * 
from dbo.tripdata_combined;

-- checking for null values
select * 
from dbo.tripdata_combined
where ride_id is null
or rideable_type is null
or started_at is null
or  ended_at is null
or start_station_name is null
or start_station_id is null
or start_lat is null
or start_lng is null
or end_lat is null
or end_lng is null
or member_casual is null;
-- deleting null
Delete from dbo.tripdata_combined
where ride_id is null
or rideable_type is null
or started_at is null
or  ended_at is null
or start_station_name is null
or start_station_id is null
or start_lat is null
or start_lng is null
or end_lat is null
or end_lng is null
or member_casual is null;

-- checking for duplicates
select ride_id,
rideable_type,
started_at ,
ended_at,
start_station_name,
start_station_id,
start_lat,
start_lng,
end_lat,
end_lng,
member_casual, 
count(*) as duplicate_count
from dbo.tripdata_combined
group by ride_id,
rideable_type,
started_at ,
ended_at,
start_station_name,
start_station_id,
start_lat,
start_lng,
end_lat,
end_lng,
member_casual
having count(*)>1;

-- riders by members and casual users
select member_casual,
count(ride_id) as number_of_rides
from dbo.tripdata_combined
group by member_casual;
-- rideable type by members and casual users
select member_casual,rideable_type,
count(rideable_type)
from dbo.tripdata_combined
group by member_casual,rideable_type; 
-- mostly used start station 
SELECT
    member_casual,
    start_station_id,
    start_station_name,
    COUNT(start_station_id) AS start_count
FROM dbo.tripdata_combined
GROUP BY member_casual, start_station_id, start_station_name
ORDER BY COUNT(start_station_id) DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;
-- mostly used end station
SELECT
    member_casual,
    end_station_id,
    end_station_name,
    COUNT(end_station_id) AS end_count
FROM dbo.tripdata_combined
GROUP BY member_casual, end_station_id, end_station_name
ORDER BY COUNT(end_station_id) DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;
-- started time ananlysis
SELECT 
    member_casual,
    DATEPART(HOUR, started_at) AS start_hour,
    COUNT(*) AS ride_count
FROM dbo.tripdata_combined
GROUP BY member_casual, DATEPART(HOUR, started_at)
ORDER BY member_casual, start_hour;
-- rides by day of week
SELECT 
    member_casual,
    DATENAME(WEEKDAY, started_at) AS day_of_week,
    COUNT(*) AS ride_count
FROM dbo.tripdata_combined
GROUP BY member_casual, DATENAME(WEEKDAY, started_at)
ORDER BY member_casual, 
         CASE DATENAME(WEEKDAY, started_at)
             WHEN 'Monday' THEN 1
             WHEN 'Tuesday' THEN 2
             WHEN 'Wednesday' THEN 3
             WHEN 'Thursday' THEN 4
             WHEN 'Friday' THEN 5
             WHEN 'Saturday' THEN 6
             WHEN 'Sunday' THEN 7
         END;
-- month analysis
SELECT 
    member_casual,
    FORMAT(started_at, 'yyyy-MM') AS month,
    COUNT(*) AS ride_count
FROM dbo.tripdata_combined
GROUP BY member_casual, FORMAT(started_at, 'yyyy-MM')
ORDER BY month, member_casual;
-- ended time analysis
SELECT 
    member_casual,
    DATEPART(HOUR, ended_at) AS end_hour,
    COUNT(*) AS ride_count
FROM dbo.tripdata_combined
GROUP BY member_casual, DATEPART(HOUR, ended_at)
ORDER BY member_casual, end_hour;
-- rides by day of week
SELECT 
    member_casual,
    DATENAME(WEEKDAY, ended_at) AS day_of_week,
    COUNT(*) AS ride_count
FROM dbo.tripdata_combined
GROUP BY member_casual, DATENAME(WEEKDAY, ended_at)
ORDER BY member_casual, 
         CASE DATENAME(WEEKDAY, ended_at)
             WHEN 'Monday' THEN 1
             WHEN 'Tuesday' THEN 2
             WHEN 'Wednesday' THEN 3
             WHEN 'Thursday' THEN 4
             WHEN 'Friday' THEN 5
             WHEN 'Saturday' THEN 6
             WHEN 'Sunday' THEN 7
         END;
-- month analysis
SELECT 
    member_casual,
    FORMAT(ended_at, 'yyyy-MM') AS month,
    COUNT(*) AS ride_count
FROM dbo.tripdata_combined
GROUP BY member_casual, FORMAT(ended_at, 'yyyy-MM')
ORDER BY month, member_casual;















with cte as(
SELECT 
    server_id,
   max(CASE 
        WHEN session_status = 'start' THEN status_time 
    END) AS startTime,
    max(CASE 
        WHEN session_status = 'stop' THEN status_time 
    END) AS stopTime
FROM server_utilization
group by server_id
)
select server_id,
startTime,
stopTime,
stopTime-startTime as Uptime
from cte
order by server_id
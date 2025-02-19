CREATE TABLE server_utilization (
    server_id INTEGER,
    status_time TIMESTAMP,
    session_status VARCHAR(10)  -- Assuming values like 'start' and 'stop'
);

INSERT INTO server_utilization (server_id, status_time, session_status) VALUES
-- Server 1 starts and stops multiple times
(1, '2022-08-02 10:00:00', 'start'),
(1, '2022-08-02 18:30:00', 'stop'),
(1, '2022-08-03 09:15:00', 'start'),
(1, '2022-08-03 20:45:00', 'stop'),
(1, '2022-08-04 08:00:00', 'start'),
(1, '2022-08-04 22:00:00', 'stop'),

-- Server 2 multiple sessions
(2, '2022-08-17 10:00:00', 'start'),
(2, '2022-08-17 22:30:00', 'stop'),
(2, '2022-08-18 09:00:00', 'start'),
(2, '2022-08-18 21:15:00', 'stop'),
(2, '2022-08-24 10:00:00', 'start'),
(2, '2022-08-24 23:55:00', 'stop'),

-- Server 3 multiple sessions
(3, '2022-09-05 08:30:00', 'start'),
(3, '2022-09-05 20:45:00', 'stop'),
(3, '2022-09-06 10:00:00', 'start'),
(3, '2022-09-06 18:10:00', 'stop'),

-- Server 4 multiple sessions
(4, '2022-09-01 09:15:00', 'start'),
(4, '2022-09-01 23:30:00', 'stop'),
(4, '2022-09-02 06:45:00', 'start'),
(4, '2022-09-02 14:30:00', 'stop');

WITH session_pairs AS (
    SELECT 
        server_id,
        status_time AS start_time,
        LEAD(status_time) OVER (PARTITION BY server_id ORDER BY status_time) AS stop_time
    FROM server_utilization
    WHERE session_status = 'start'
)
SELECT 
    server_id,
    SUM(EXTRACT(EPOCH FROM (stop_time - start_time))) AS total_uptime_seconds,
    SUM(stop_time - start_time) AS total_uptime_interval
FROM session_pairs
WHERE stop_time IS NOT NULL
GROUP BY server_id
ORDER BY server_id;
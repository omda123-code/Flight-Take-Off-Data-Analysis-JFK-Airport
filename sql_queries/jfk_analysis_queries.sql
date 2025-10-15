use [Flight Take Off Data]
select * from Flights

-------------------------------------------------------------
-- 1️. Find average departure delay per airline
-- Purpose: Identify which carriers tend to have the most delays.
-------------------------------------------------------------
SELECT OP_UNIQUE_CARRIER AS Carrier,
       AVG(DEP_DELAY) AS Avg_Departure_Delay
FROM Flights
GROUP BY OP_UNIQUE_CARRIER
ORDER BY Avg_Departure_Delay DESC;


-------------------------------------------------------------
-- 2️. Count total flights per destination
-- Purpose: Understand the most popular destinations.
-------------------------------------------------------------
SELECT DEST AS Destination,
       COUNT(*) AS Total_Flights
FROM Flights
GROUP BY DEST
ORDER BY Total_Flights DESC;


-------------------------------------------------------------
-- 3️. Average flight distance per carrier
-- Purpose: See which airlines operate longer routes on average.
-------------------------------------------------------------
SELECT OP_UNIQUE_CARRIER,
       AVG(DISTANCE) AS Avg_Distance
FROM Flights
GROUP BY OP_UNIQUE_CARRIER
ORDER BY Avg_Distance DESC;


-------------------------------------------------------------
-- 4️. Correlation between departure delay and distance
-- Purpose: Check if long flights tend to have more delays.
-------------------------------------------------------------
SELECT 
    CASE 
        WHEN DISTANCE < 500 THEN 'Short Haul'
        WHEN DISTANCE BETWEEN 500 AND 1500 THEN 'Medium Haul'
        ELSE 'Long Haul'
    END AS Flight_Type,
    AVG(DEP_DELAY) AS Avg_Delay
FROM Flights
GROUP BY 
    CASE 
        WHEN DISTANCE < 500 THEN 'Short Haul'
        WHEN DISTANCE BETWEEN 500 AND 1500 THEN 'Medium Haul'
        ELSE 'Long Haul'
    END;


-------------------------------------------------------------
-- 5️. On-time performance by day of week
-- Purpose: Identify which weekday has the most delays.
-------------------------------------------------------------
SELECT DAY_OF_WEEK,
       AVG(DEP_DELAY) AS Avg_Delay
FROM Flights
GROUP BY DAY_OF_WEEK
ORDER BY Avg_Delay DESC;


-------------------------------------------------------------
-- 6️. Flights delayed more than 15 minutes
-- Purpose: Quantify flights considered as delayed.
-------------------------------------------------------------
SELECT COUNT(*) AS Total_Flights,
       SUM(CASE WHEN DEP_DELAY > 15 THEN 1 ELSE 0 END) AS Delayed_Flights,
       ROUND(SUM(CASE WHEN DEP_DELAY > 15 THEN 1.0 ELSE 0 END) / COUNT(*) * 100, 2) AS Delay_Percentage
FROM Flights;


-------------------------------------------------------------
-- 7️. Average taxi-out time per destination
-- Purpose: Analyze ground congestion at different airports.
-------------------------------------------------------------
SELECT DEST,
       AVG(TAXI_OUT) AS Avg_TaxiOut
FROM Flights
GROUP BY DEST
ORDER BY Avg_TaxiOut DESC;


-------------------------------------------------------------
-- 8️. Weather impact on departure delay
-- Purpose: Compare average delay between Fair and Windy conditions.
-------------------------------------------------------------
SELECT Condition,
       COUNT(*) AS Total_Flights,
       AVG(DEP_DELAY) AS Avg_Delay
FROM Flights
GROUP BY Condition
ORDER BY Avg_Delay DESC;


-------------------------------------------------------------
-- 9️. Find top 10 longest scheduled flights
-- Purpose: Identify the flights with longest planned duration.
-------------------------------------------------------------
SELECT TOP 10
       OP_UNIQUE_CARRIER,
       DEST,
       CRS_ELAPSED_TIME AS Scheduled_Time,
       DISTANCE
FROM Flights
ORDER BY CRS_ELAPSED_TIME DESC;


-------------------------------------------------------------
-- 10. Compare scheduled vs. actual departure time
-- Purpose: Evaluate adherence to schedule.
-------------------------------------------------------------
SELECT 
    OP_UNIQUE_CARRIER,
    AVG(DEP_TIME_M - CRS_DEP_M) AS Avg_Departure_Deviation
FROM Flights
GROUP BY OP_UNIQUE_CARRIER
ORDER BY Avg_Departure_Deviation DESC;


-------------------------------------------------------------
-- 11️. Monthly delay trend
-- Purpose: Understand delay trends over months.
-------------------------------------------------------------
SELECT MONTH,
       AVG(DEP_DELAY) AS Avg_Delay
FROM Flights
GROUP BY MONTH
ORDER BY MONTH;


-------------------------------------------------------------
-- 12️. Find flights with extreme wind conditions
-- Purpose: Investigate how high winds affect operations.
-------------------------------------------------------------
SELECT *
FROM Flights
WHERE Wind_Speed > 30
ORDER BY DEP_DELAY DESC;


-------------------------------------------------------------
-- 13️. Pressure vs. Delay relation
-- Purpose: Test if low pressure correlates with higher delay.
-------------------------------------------------------------
SELECT 
    CASE WHEN Pressure < 29.8 THEN 'Low Pressure'
         WHEN Pressure BETWEEN 29.8 AND 30.1 THEN 'Normal'
         ELSE 'High Pressure' END AS Pressure_Range,
    AVG(DEP_DELAY) AS Avg_Delay
FROM Flights
GROUP BY 
    CASE WHEN Pressure < 29.8 THEN 'Low Pressure'
         WHEN Pressure BETWEEN 29.8 AND 30.1 THEN 'Normal'
         ELSE 'High Pressure' END
ORDER BY Avg_Delay DESC;


-------------------------------------------------------------
-- 14️. Average humidity and delay per condition
-- Purpose: Analyze environmental effect on operations.
-------------------------------------------------------------
SELECT Condition,
       AVG(Humidity) AS Avg_Humidity,
       AVG(DEP_DELAY) AS Avg_Delay
FROM Flights
GROUP BY Condition
ORDER BY Avg_Delay DESC;


-------------------------------------------------------------
-- 15️. Top carriers by on-time percentage
-- Purpose: Rank airlines by performance.
-------------------------------------------------------------
SELECT OP_UNIQUE_CARRIER,
       COUNT(*) AS Total_Flights,
       SUM(CASE WHEN DEP_DELAY <= 0 THEN 1 ELSE 0 END) AS OnTime_Flights,
       ROUND(SUM(CASE WHEN DEP_DELAY <= 0 THEN 1.0 ELSE 0 END) / COUNT(*) * 100, 2) AS OnTime_Percentage
FROM Flights
GROUP BY OP_UNIQUE_CARRIER
ORDER BY OnTime_Percentage DESC;


-------------------------------------------------------------
-- 16️. Average delay by hour of day
-- Purpose: Identify when delays are most common.
-------------------------------------------------------------
SELECT sch_dep AS Hour_of_Day,
       AVG(DEP_DELAY) AS Avg_Delay
FROM Flights
GROUP BY sch_dep
ORDER BY sch_dep;


-------------------------------------------------------------
-- 17️. Correlate wind speed and taxi-out time
-- Purpose: Test if strong winds increase ground time.
-------------------------------------------------------------
SELECT 
    ROUND(Wind_Speed,0) AS Wind_Speed,
    AVG(TAXI_OUT) AS Avg_Taxi_Out
FROM Flights
GROUP BY ROUND(Wind_Speed,0)
ORDER BY Wind_Speed;


-------------------------------------------------------------
-- 18️. Find worst weather days (average delay per day)
-- Purpose: Identify specific days with high delays due to weather.
-------------------------------------------------------------
SELECT MONTH, DAY_OF_MONTH,
       AVG(DEP_DELAY) AS Avg_Delay,
       COUNT(*) AS Total_Flights
FROM Flights
GROUP BY MONTH, DAY_OF_MONTH
HAVING AVG(DEP_DELAY) > 15
ORDER BY Avg_Delay DESC;

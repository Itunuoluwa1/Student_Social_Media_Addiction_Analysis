-- I created a new database for the project
-- CREATE DATABASE SSMA_DB

-- Select all statemaent to view the dataset
SELECT * FROM Students_Social_Media_Addiction

-- Platform by average addiction
SELECT [Most_Used_Platform], AVG([Addicted_Score]) AS Avg_Addiction FROM Students_Social_Media_Addiction
GROUP BY [Most_Used_Platform]
ORDER BY Avg_Addiction DESC

-- Avg addiction and sleep by gender
SELECT [Gender], 
       AVG([Addicted_Score]) AS Avg_Addiction,
       AVG(Sleep_Hours_Per_Night) AS Avg_Sleep
FROM Students_Social_Media_Addiction
GROUP BY Gender

-- Platform addiction ranking
SELECT Most_Used_Platform, ROUND(AVG(Addicted_Score), 2) AS Avg_Addiction
FROM Students_Social_Media_Addiction
GROUP BY Most_Used_Platform
ORDER BY Avg_Addiction DESC;

-- Check academic impact
SELECT Academic_Level,
       SUM(CASE WHEN 
	   Affects_Academic_Performance = 1
	   THEN 1 
	   ELSE 0 
	   END) * 100.0 / COUNT(*) AS Percent_Affected
FROM Students_Social_Media_Addiction
GROUP BY Academic_Level;


-- KEY PERFORMANCE INDICATORS (KPIs)
SELECT AVG([Addicted_Score]) AS Average_Addiction_Score FROM [dbo].[Students_Social_Media_Addiction]
SELECT AVG([Avg_Daily_Usage_Hours]) AS Average_Daily_Usage_Hours FROM [dbo].[Students_Social_Media_Addiction]
SELECT AVG([Sleep_Hours_Per_Night]) AS Avg_Sleep_Hours_per_Night FROM [dbo].[Students_Social_Media_Addiction]
SELECT AVG([Mental_Health_Score]) AS Avg_Mental_Health_Score FROM [dbo].[Students_Social_Media_Addiction]
SELECT AVG(CAST([Conflicts_Over_Social_Media] AS DECIMAL(10,2))) AS Conflicts_per_Student FROM [dbo].[Students_Social_Media_Addiction]

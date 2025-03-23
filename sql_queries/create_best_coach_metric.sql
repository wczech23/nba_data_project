USE wczech_2;
GO

CREATE VIEW dbo.max_coach_metric
AS

WITH Avg_PER_Diff AS (SELECT cm.Team, cm.Coach, AVG(cm.PER_Diff) AS Avg_PER_Diff 
FROM wczech_2.dbo.coaching_metrics cm
GROUP BY Team, Coach)
,
Ranked_Coaches AS (
    SELECT 
        Team,
        Coach,
        Avg_PER_Diff,
        RANK() OVER (PARTITION BY Team ORDER BY Avg_PER_Diff DESC) AS Coach_Rank
    FROM 
        Avg_PER_Diff
)
SELECT 
    Team,
    Coach,
    Avg_PER_Diff
FROM 
    Ranked_Coaches
WHERE 
    Coach_Rank = 1;

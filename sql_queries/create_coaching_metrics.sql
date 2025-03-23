-- Joining Coach and Player Tables, Creating Coaching Metrics
USE wczech_2;
GO

CREATE VIEW dbo.coaching_metrics AS

WITH pcd AS (
    SELECT 
        cs.Coach, 
        ps.Player, 
        ps.Team, 
        ps.Year, 
        ps.PER, 
        ps.WS 
    FROM wczech_2.dbo.player_stats AS ps
    INNER JOIN wczech_2.dbo.coach_stats AS cs -- Merging coach and player stats data tables
        ON ps.Year = cs.Yr 
        AND ps.Team = cs.Team
    WHERE ps.Player IN ( -- Filtering out players that have played less than 3 years in NBA
        SELECT Player
        FROM wczech_2.dbo.player_stats
        GROUP BY Player
        HAVING COUNT(DISTINCT Year) > 2
    )
),

pcd_agg AS (
    SELECT 
		pcd.Coach,
        pcd.Player, 
        CAST(AVG(pcd.WS) AS DECIMAL(5,2)) AS Avg_WS_With_Coach, -- Calculating average WS and PER for player/coach combinations
        CAST(AVG(pcd.PER) AS DECIMAL(5,2)) AS Avg_PER_With_Coach,
        
        (SELECT CAST(AVG(pcd_inner.WS) AS DECIMAL(5,2)) -- Calculating average WS and PER for all coaches not in the player/coach combination
         FROM pcd pcd_inner
         WHERE pcd_inner.Player = pcd.Player 
         AND pcd_inner.Coach <> pcd.Coach
        ) AS Avg_WS_Without_Coach,

        (SELECT CAST(AVG(pcd_inner.PER) AS DECIMAL(5,2)) 
         FROM pcd pcd_inner
         WHERE pcd_inner.Player = pcd.Player 
         AND pcd_inner.Coach <> pcd.Coach
        ) AS Avg_PER_Without_Coach
    FROM pcd
    WHERE pcd.Player IN ( -- Filtering out players with only 1 coach
        SELECT Player
        FROM pcd
        GROUP BY Player
        HAVING COUNT(DISTINCT Coach) > 1
    )
    GROUP BY pcd.Coach, pcd.Player
)

SELECT 
    *, 
    (Avg_WS_With_Coach - Avg_WS_Without_Coach) AS WS_Diff, 
    (Avg_PER_With_Coach - Avg_PER_Without_Coach) AS PER_Diff
FROM pcd_agg;

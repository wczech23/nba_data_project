USE wczech_2;
GO

ALTER VIEW dbo.player_metrics_top_player
AS

WITH player_salary_join AS (
	SELECT ps.Player, ps.Year, CAST(ps.Salary_Adj AS decimal(18,2)) AS Salary_Adj, pst.WS, pst.Team
	FROM wczech_2.dbo.player_salaries ps
	INNER JOIN wczech_2.dbo.player_stats pst
	ON pst.Player = ps.Player AND pst.Year = ps.Year
	WHERE pst.Team NOT IN ('2TM', '3TM', '4TM', '5TM') 
		AND ps.Player IN ( -- Filtering out players that have played less than 2 Seasons in the NBA
        SELECT Player
        FROM wczech_2.dbo.player_stats
        GROUP BY Player
        HAVING SUM(G) >= 164
    )
),
Player_Contr AS (SELECT Player, Team,
	   CASE
		WHEN (SUM(Salary_Adj) / 1000000) = 0 THEN NULL
		ELSE (SUM(WS) / (SUM(Salary_Adj) / 1000000)) 
	   END AS Wins_Contributed_Per_1m
FROM player_salary_join
GROUP BY Player, Team),

Ranked_Players AS (
	SELECT *, RANK() OVER (PARTITION BY Team ORDER BY Wins_Contributed_Per_1m DESC) AS Player_Rank
	FROM Player_Contr
)
SELECT Team, Player, Wins_Contributed_Per_1m 
FROM Ranked_Players
WHERE Player_Rank = 1



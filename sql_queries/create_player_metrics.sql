USE wczech_2;
GO

ALTER VIEW dbo.player_metrics
AS

WITH player_salary_join AS (
	SELECT ps.Player, ps.Year, CAST(ps.Salary_Adj AS bigint) AS Salary_Adj, pst.WS, pst.Team
	FROM wczech_2.dbo.player_salaries ps
	INNER JOIN wczech_2.dbo.player_stats pst
	ON pst.Player = ps.Player AND pst.Year = ps.Year
	WHERE pst.Team NOT IN ('2TM', '3TM', '4TM', '5TM') 
		AND ps.Player IN ( -- Filtering out players that have played less than 240 games in the NBA
        SELECT Player
        FROM wczech_2.dbo.player_stats
        GROUP BY Player
        HAVING SUM(G) > 240
    )
)

SELECT Team,
	   CASE
		WHEN (SUM(Salary_Adj) / 100000) = 0 THEN NULL
		ELSE (SUM(WS) / (SUM(Salary_Adj) / 100000)) 
	   END AS Wins_Contributed_Per_100k
FROM player_salary_join
GROUP BY Team

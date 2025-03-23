USE wczech_2;
GO

CREATE VIEW dbo.team_salary_metrics AS

WITH team_wins AS (
	SELECT Team, CAST(LEFT(Overall_Record, CHARINDEX('-', Overall_Record) - 1) AS INT) AS RS_W, Yr
	FROM wczech_2.dbo.team_stats
),

player_salaries AS (
	SELECT ps.Player, ps.Year, ps.Salary_Adj, pst.Team
	FROM wczech_2.dbo.player_salaries AS ps
	INNER JOIN wczech_2.dbo.player_stats AS pst
	ON ps.Player = pst.Player AND ps.Year = pst.Year
),

team_player_joined AS (
	SELECT tw.Team, tw.RS_W, ps.Player, ps.Salary_Adj, ps.Year
	FROM team_wins tw
	INNER JOIN player_salaries ps
	ON tw.Team = ps.Team AND tw.Yr = ps.Year
)

SELECT Team, Year, (SUM(Salary_Adj) / SUM(RS_W)) AS Dollars_Per_RS_W
FROM team_player_joined
GROUP BY Team, Year

--SELECT * FROM team_wins
--SELECT * FROM player_salaries

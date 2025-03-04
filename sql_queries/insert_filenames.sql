INSERT INTO wczech_2.dbo.coaching_files(FileName)
EXEC xp_cmdshell 'DIR C:\Users\Will\Documents\nba_data_project\coaching_data\*.csv /B'

INSERT INTO wczech_2.dbo.team_files(Filename)
EXEC xp_cmdshell 'DIR C:\Users\Will\Documents\nba_data_project\team_data /B'

INSERT INTO wczech_2.dbo.player_stats_files(Filename)
EXEC xp_cmdshell 'DIR C:\Users\Will\Documents\nba_data_project\player_stats /B'

INSERT INTO wczech_2.dbo.player_salary_files(Filename)
EXEC xp_cmdshell 'DIR C:\Users\Will\Documents\nba_data_project\player_salaries /B'
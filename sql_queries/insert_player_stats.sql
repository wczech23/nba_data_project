-- Bulk Insert Player Stats Data

DECLARE @FileName NVARCHAR(255);
DECLARE @SQL NVARCHAR(MAX);

DECLARE FileCursor CURSOR FOR 
SELECT FileName FROM wczech_2.dbo.player_stats_files;

OPEN FileCursor;
FETCH NEXT FROM FileCursor INTO @FileName;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @SQL = 'BULK INSERT wczech_2.dbo.player_stats
                FROM ''C:\Users\Will\Documents\nba_data_project\player_stats\' + @FileName + '''
                WITH (
                    FIELDTERMINATOR = '','',
                    ROWTERMINATOR = ''0x0A'',
                    FIRSTROW = 2,
                    TABLOCK
                );';

    PRINT @SQL;
    EXEC sp_executesql @SQL;

    FETCH NEXT FROM FileCursor INTO @FileName;
END;

CLOSE FileCursor;
DEALLOCATE FileCursor;
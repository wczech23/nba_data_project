-- Bulk Insert Coaching Data

DECLARE @FileName NVARCHAR(255);
DECLARE @SQL NVARCHAR(MAX);

DECLARE FileCursor CURSOR FOR 
SELECT FileName FROM wczech_2.dbo.coaching_files;

OPEN FileCursor;
FETCH NEXT FROM FileCursor INTO @FileName;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @SQL = 'BULK INSERT wczech_2.dbo.coach_stats
                FROM ''C:\Users\Will\Documents\nba_data_project\coaching_data\' + @FileName + '''
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
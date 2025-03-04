DECLARE @FileName NVARCHAR(255);
DECLARE @SQL NVARCHAR(MAX);

DECLARE FileCursor CURSOR FOR 
SELECT FileName FROM team_files;

OPEN FileCursor;
FETCH NEXT FROM FileCursor INTO @FileName;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @SQL = 'BULK INSERT t1
                FROM ''C:\Users\Will\Documents\nba_data_project\coaching_data\' + @FileName + '''
                WITH (
                    FIRSTROW = 2,
                    FIELDTERMINATOR = '','',
                    ROWTERMINATOR = '',
                    TABLOCK
                );';

    PRINT @SQL;
    EXEC sp_executesql @SQL;

    FETCH NEXT FROM FileCursor INTO @FileName;
END;


CLOSE FileCursor;
DEALLOCATE FileCursor;
DROP TABLE #FileList;

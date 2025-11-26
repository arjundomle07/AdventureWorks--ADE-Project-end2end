
-- Stored Procedure: usp_CreateViewFromFile
CREATE OR ALTER PROCEDURE usp_CreateViewFromFile
    @FileName NVARCHAR(100)
AS
BEGIN
    DECLARE @sql NVARCHAR(MAX);
    DECLARE @ViewName NVARCHAR(100);

    -- Remove file extension for view name
    SET @ViewName = LEFT(@FileName, LEN(@FileName) - CHARINDEX('.', REVERSE(@FileName)));

    SET @sql = '
    CREATE OR ALTER VIEW dbo.' + @ViewName + ' AS
    SELECT * FROM OPENROWSET(
        BULK ''https://<storage-account>.dfs.core.windows.net/gold/SalesLT/' + @FileName + ''',
        FORMAT = ''CSV'',
        FIELDTERMINATOR = '','',
        ROWTERMINATOR = ''\n'',
        FIRSTROW = 2
    ) AS [result];';

    EXEC sp_executesql @sql;
END;

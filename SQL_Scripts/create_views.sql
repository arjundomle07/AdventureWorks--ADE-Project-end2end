
-- Create a view for the 'Address' table from the Gold layer
CREATE OR ALTER VIEW dbo.Address AS
SELECT *
FROM OPENROWSET(
    BULK 'https://<storage-account>.dfs.core.windows.net/gold/SalesLT/Address.csv',
    FORMAT = 'CSV',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
) AS [result];

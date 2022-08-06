USE dcjs_database;
GO

SET NOCOUNT ON;

DROP TABLE IF EXISTS #commandTable;
GO

DECLARE
  @sqlString NVARCHAR(4000),
  @itemID INT

CREATE TABLE #commandTable (
  id INT IDENTITY(1,1) NOT NULL,
  sqlString NVARCHAR(4000) NOT NULL,
  processed TINYINT NULL
);


INSERT INTO #commandTable(sqlString)
SELECT 'EXEC sp_dropExtendedProperty @name =N' + QUOTENAME(extended_properties.[name],'''') + ', @level0Type =N''SCHEMA'', @level0Name = ''dbo'', @level1Type =N''TABLE'', @level1Name =' + QUOTENAME(tables.[name],'''') + ', @level2Type =N''COLUMN'', @level2Name = ' + QUOTENAME(columns.[name],'''') AS sqlString
FROM sys.extended_properties
INNER JOIN sys.tables
  ON tables.[object_id] = extended_properties.major_id
INNER JOIN sys.columns 
  ON columns.[object_id] = tables.[object_id]
  AND columns.column_id = extended_properties.minor_id;

INSERT INTO #commandTable(sqlString)
SELECT 'EXEC sp_dropExtendedProperty @name =N' + QUOTENAME(extended_properties.[name],'''') + ', @level0Type =N''SCHEMA'',@level0Name = ''dbo'', @level1Type =N''TABLE'', @level1Name =' + QUOTENAME(tables.[name],'''') AS sqlString
FROM sys.extended_properties
INNER JOIN sys.tables
  ON tables.[object_id] = extended_properties.major_id
WHERE extended_properties.minor_id = 0;

--SELECT * FROM #commandTable;

WHILE EXISTS(SELECT 1 FROM #commandTable WHERE processed IS NULL)
BEGIN
  SELECT TOP 1 
    @itemID = ID,
    @sqlString = sqlString
  FROM #commandTable 
  WHERE processed IS NULL;

  EXEC (@sqlString);

  UPDATE #commandTable
  SET processed = 1
  WHERE id = @itemID;

END

--extended properties for object dbo.dialysis_hpc

--Table:Name  [weight]
EXEC sys.sp_addextendedProperty
  @name = N'Name',
  @value = N'weight',
  @level0type = N'SCHEMA',
  @level0Name = 'dbo',
  @level1type = N'TABLE',
  @level1Name = 'weight';
GO

--Table:Description   [weight]
EXEC sys.sp_addExtendedProperty
  @name = N'Description',
  @value = N'Table to maintain statistics on weight',
  @level0Type = N'SCHEMA',
  @level0Name = 'dbo',
  @level1Type = 'TABLE',
  @level1Name = 'weight';
GO

--Column:Description  [id]
EXEC sys.sp_addExtendedProperty
  @name = N'Description',
  @value = N'Column Description',
  @level0type = N'SCHEMA',
  @level0name = 'dbo',
  @level1type = N'TABLE',
  @level1name = 'weight',
  @level2type = N'COLUMN',
  @level2name = 'id';
GO

--Column:Description  [idPatient]
EXEC sys.sp_addExtendedProperty
  @name = N'Description',
  @value = N'Column Description',
  @level0type = N'SCHEMA',
  @level0name = 'dbo',
  @level1type = N'TABLE',
  @level1name = 'weight',
  @level2type = N'COLUMN',
  @level2name = 'idPatient';
GO

--Column:Description  [isActive]
EXEC sys.sp_addExtendedProperty
  @name = N'Description',
  @value = N'Column Description',
  @level0type = N'SCHEMA',
  @level0name = 'dbo',
  @level1type = N'TABLE',
  @level1name = 'weight',
  @level2type = N'COLUMN',
  @level2name = 'isActive';
GO

--Column:Description  [date]
EXEC sys.sp_addExtendedProperty
  @name = N'Description',
  @value = N'Column Description',
  @level0type = N'SCHEMA',
  @level0name = 'dbo',
  @level1type = N'TABLE',
  @level1name = 'weight',
  @level2type = N'COLUMN',
  @level2name = 'date';
GO

--Column:Description  [weightUnit]
EXEC sys.sp_addExtendedProperty
  @name = N'Description',
  @value = N'Column Description',
  @level0type = N'SCHEMA',
  @level0name = 'dbo',
  @level1type = N'TABLE',
  @level1name = 'weight',
  @level2type = N'COLUMN',
  @level2name = 'weightUnit';
GO

--Column:Description  [weightDry]
EXEC sys.sp_addExtendedProperty
  @name = N'Description',
  @value = N'Column Description',
  @level0type = N'SCHEMA',
  @level0name = 'dbo',
  @level1type = N'TABLE',
  @level1name = 'weight',
  @level2type = N'COLUMN',
  @level2name = 'weightDry';
GO

--Column:Description  [bmi]
EXEC sys.sp_addExtendedProperty
  @name = N'Description',
  @value = N'Column Description',
  @level0type = N'SCHEMA',
  @level0name = 'dbo',
  @level1type = N'TABLE',
  @level1name = 'weight',
  @level2type = N'COLUMN',
  @level2name = 'bmi';
GO

--Column:Description  [water]
EXEC sys.sp_addExtendedProperty
  @name = N'Description',
  @value = N'Column Description',
  @level0type = N'SCHEMA',
  @level0name = 'dbo',
  @level1type = N'TABLE',
  @level1name = 'weight',
  @level2type = N'COLUMN',
  @level2name = 'water';
GO

--Column:Description  [bodyFat]
EXEC sys.sp_addExtendedProperty
  @name = N'Description',
  @value = N'Column Description',
  @level0type = N'SCHEMA',
  @level0name = 'dbo',
  @level1type = N'TABLE',
  @level1name = 'weight',
  @level2type = N'COLUMN',
  @level2name = 'bodyFat';
GO

--Column:Description  [muscleMass]
EXEC sys.sp_addExtendedProperty
  @name = N'Description',
  @value = N'Column Description',
  @level0type = N'SCHEMA',
  @level0name = 'dbo',
  @level1type = N'TABLE',
  @level1name = 'weight',
  @level2type = N'COLUMN',
  @level2name = 'muscleMass';
GO

--Column:Description  [boneDensity]
EXEC sys.sp_addExtendedProperty
  @name = N'Description',
  @value = N'Column Description',
  @level0type = N'SCHEMA',
  @level0name = 'dbo',
  @level1type = N'TABLE',
  @level1name = 'weight',
  @level2type = N'COLUMN',
  @level2name = 'boneDensity';
GO

--Column:Description  [shortDescription]
EXEC sys.sp_addExtendedProperty
  @name = N'Description',
  @value = N'Column Description',
  @level0type = N'SCHEMA',
  @level0name = 'dbo',
  @level1type = N'TABLE',
  @level1name = 'weight',
  @level2type = N'COLUMN',
  @level2name = 'shortDescription';
GO

--Column:Description  [dateCreated]
EXEC sys.sp_addExtendedProperty
  @name = N'Description',
  @value = N'Column Description',
  @level0type = N'SCHEMA',
  @level0name = 'dbo',
  @level1type = N'TABLE',
  @level1name = 'weight',
  @level2type = N'COLUMN',
  @level2name = 'dateCreated';
GO

--Column:Description  [dateModified]
EXEC sys.sp_addExtendedProperty
  @name = N'Description',
  @value = N'Column Description',
  @level0type = N'SCHEMA',
  @level0name = 'dbo',
  @level1type = N'TABLE',
  @level1name = 'weight',
  @level2type = N'COLUMN',
  @level2name = 'dateModified';
GO

--Column:Description  [createdBy]
EXEC sys.sp_addExtendedProperty
  @name = N'Description',
  @value = N'Column Description',
  @level0type = N'SCHEMA',
  @level0name = 'dbo',
  @level1type = N'TABLE',
  @level1name = 'weight',
  @level2type = N'COLUMN',
  @level2name = 'createdBy';
GO

--Column:Description  [modifiedBy]
EXEC sys.sp_addExtendedProperty
  @name = N'Description',
  @value = N'Column Description',
  @level0type = N'SCHEMA',
  @level0name = 'dbo',
  @level1type = N'TABLE',
  @level1name = 'weight',
  @level2type = N'COLUMN',
  @level2name = 'modifiedBy';
GO

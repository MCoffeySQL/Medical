USE medical;
GO

DROP TRIGGER IF EXISTS temp$modified;
GO

CREATE OR ALTER TRIGGER dbo.temp$modified
ON dbo.[temp]
AFTER INSERT,UPDATE
AS
BEGIN
  UPDATE dbo.[temp]
  SET
    dateModified = GETDATE(),
    modifiedBy = 'pat0000'
  FROM dbo.[temp]
  JOIN inserted 
    ON [temp].id = inserted.id;
END;
GO
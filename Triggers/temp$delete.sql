USE medical;
GO

DROP TRIGGER IF EXISTS temp$delete;
GO

CREATE OR ALTER TRIGGER dbo.temp$delete
ON dbo.[temp]
INSTEAD OF DELETE
AS
BEGIN
  UPDATE dbo.[temp]
  SET
    isActive = 0,
    dateModified = GETDATE(),
    modifiedBy = 'pat0000'
  FROM dbo.[temp]
  JOIN deleted 
    ON [temp].id = deleted.id
END;
GO
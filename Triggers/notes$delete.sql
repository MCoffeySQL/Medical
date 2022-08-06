USE medical;
GO

DROP TRIGGER IF EXISTS notes$delete;
GO

CREATE OR ALTER TRIGGER dbo.notes$delete
ON dbo.[notes]
INSTEAD OF DELETE
AS
BEGIN
  UPDATE dbo.[notes]
  SET
    isActive = 0,
    dateModified = GETDATE(),
    modifiedBy = 'pat0000'
  FROM dbo.[notes]
  JOIN deleted 
    ON [notes].id = deleted.id
END;
GO
USE medical;
GO

DROP TRIGGER IF EXISTS weight$delete;
GO

CREATE OR ALTER TRIGGER dbo.weight$delete
ON dbo.[weight]
INSTEAD OF DELETE
AS
BEGIN
  UPDATE dbo.[weight]
  SET
    isActive = 0,
    dateModified = GETDATE(),
    modifiedBy = 'pat0000'
  FROM dbo.[weight]
  JOIN deleted 
    ON [weight].id = deleted.id
END;
GO
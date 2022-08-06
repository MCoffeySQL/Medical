USE medical;
GO

DROP TRIGGER IF EXISTS weight$modified;
GO

CREATE OR ALTER TRIGGER dbo.weight$modified
ON dbo.[weight]
AFTER INSERT,UPDATE
AS
BEGIN
  UPDATE dbo.[weight]
  SET
    dateModified = GETDATE(),
    modifiedBy = 'pat0000'
  FROM dbo.[weight]
  JOIN inserted 
    ON [weight].id = inserted.id;
END;
GO
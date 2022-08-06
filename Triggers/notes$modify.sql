USE medical;
GO

DROP TRIGGER IF EXISTS notes$modified;
GO

CREATE OR ALTER TRIGGER dbo.notes$modified
ON dbo.[notes]
AFTER INSERT,UPDATE
AS
BEGIN
  UPDATE dbo.[notes]
  SET
    dateModified = GETDATE(),
    modifiedBy = 'pat0000'
  FROM dbo.[notes]
  JOIN inserted 
    ON [notes].id = inserted.id;
END;
GO
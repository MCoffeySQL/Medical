USE medical;
GO

DROP TRIGGER IF EXISTS dialysis_hpm$modified;
GO

CREATE OR ALTER TRIGGER dbo.dialysis_hpm$modified
ON dbo.dialysis_hpm
AFTER INSERT,UPDATE
AS
BEGIN
  UPDATE dbo.dialysis_hpm
  SET
    dateModified = GETDATE(),
    modifiedBy = 'pat0000'
  FROM dbo.dialysis_hpm
  JOIN inserted 
    ON dialysis_hpm.id = inserted.id;
END
GO
USE medical;
GO

DROP TRIGGER IF EXISTS dialysis_hpm$deleted;
GO

CREATE OR ALTER TRIGGER dbo.dialysis_hpm$deleted
ON dbo.dialysis_hpm
INSTEAD OF DELETE
AS
BEGIN
  UPDATE dbo.dialysis_hpm
  SET
    isActive = 0,
    dateModified = GETDATE(),
    modifiedBy = 'pat0000'
  FROM dbo.dialysis_hpm
  JOIN deleted 
    ON dialysis_hpm.id = deleted.id
END;
GO
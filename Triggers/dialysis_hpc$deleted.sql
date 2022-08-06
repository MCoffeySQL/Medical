USE medical;
GO

DROP TRIGGER IF EXISTS dialysis_hpc$deleted;
GO

CREATE OR ALTER TRIGGER dbo.dialysis_hpc$deleted
ON dbo.dialysis_hpc
INSTEAD OF DELETE
AS
BEGIN
  UPDATE dbo.dialysis_hpc
  SET
    isActive = 0,
    dateModified = GETDATE(),
    modifiedBy = 'pat0000'
  FROM dbo.dialysis_hpc
  JOIN deleted 
    ON dialysis_hpc.id = deleted.id
END;
GO
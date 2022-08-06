USE medical;
GO

DROP TRIGGER IF EXISTS dialysis_hpc$modified;
GO

CREATE OR ALTER TRIGGER dbo.dialysis_hpc$modified
ON dbo.dialysis_hpc
AFTER INSERT,UPDATE
AS
BEGIN
  UPDATE dbo.dialysis_hpc
  SET
    dateModified = GETDATE(),
    modifiedBy = 'pat0000'
  FROM dbo.dialysis_hpc
  JOIN inserted 
    ON dialysis_hpc.id = inserted.id
END;
GO
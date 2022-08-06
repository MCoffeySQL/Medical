USE medical;
GO

DROP PROCEDURE IF EXISTS dbo.report_bp;
GO

CREATE OR ALTER PROCEDURE dbo.report_bp
AS
BEGIN
  SELECT 
    id,
    dateBP,
    systolic,
    diastolic,
    pulse,
    [position]

  FROM dbo.bp
  WHERE isActive = 1;
END
GO
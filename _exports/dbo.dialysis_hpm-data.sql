TRUNCATE TABLE dbo.dialysis_hpm;
GO

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;
USE Medical
GO

INSERT INTO dbo.dialysis_hpm(
  idPatient,
  isActive,
  dateDialysis,
  bag,
  bagLot,
  bagExp,
  timeStart,
  timeEnd,
  volFill,
  volDrain,
  timeFill,
  timeDrain,
  drainClear,
  transferSet,
  shortDescription,
  dateCreated,
  dateModified,
  createdBy,
  modifiedBy
)
SELECT
  'pat35700' AS idPatient,
  CASE
    WHEN isActive = 'Yes' 
    THEN 1
    ELSE 0
  END AS isActive,
  TRY_CAST(timeDrainStart AS DATE) AS dateDialysis,
  bag,
  NULL AS bagLot,
  NULL AS bagExpires,
  TRY_CAST(timeDrainStart AS DATETIME) AS timeStart,
  TRY_CAST(timeFillEnd AS DATETIME) AS timeEnd,
  TRY_CAST(volFill AS DECIMAL(8,2)) AS volFill,
  TRY_CAST(volDrain AS DECIMAL(8,2)) AS volDrain,
  NULL AS timeFill,
  NULL AS timeDrain,
  CASE
    WHEN drainClear = 'Yes'
    THEN 1
    ELSE 0
  END AS drainClear,
  CASE
    WHEN transferSet = 'Yes' 
    THEN 1
    ELSE 0
  END As transferSet,
  '[dialysis_hpm]' AS shortDescription,
  CAST(dateCreated AS DATE),
  CAST(dateModified AS DATE),
  'pat0000',
  'pat0000'
FROM source.dialysis_hpm;


--UPDATE dbo.dialysis_hpm
--SET 
--  timeStart = 
--    CASE WHEN LEN(timeStart) = 0 THEN NULL ELSE timeStart END,
--  timeEnd =
--    CASE WHEN LEN(timeEnd) = 0 THEN NULL ELSE timeEnd END




SELECT * FROM dbo.dialysis_hpm;
GO

TRUNCATE TABLE dbo.dialysis_hpc;
GO

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;

INSERT INTO dbo.dialysis_hpc(
    idPatient,
    isActive,
    dateDialysis,
    bag1,
    bag1Lot,
    bag1Exp,
    bag2,
    bag2Lot,
    bag2Exp,
    timeStart,
    timeEnd,
    cycles,
    systemError,
    manualDrain,
    transferSet,
    iDrain,
    totalUF,
    avgDwell,
    addDwell,
    addDwellInd,
    shortDescription,
    dateCreated,
    dateModified,
    createdBy,
    modifiedBy
  )
SELECT
  'pat35700',
  CASE
    WHEN isActive = 'Yes' 
    THEN 1
    ELSE 0
  END AS isActive,
  timeStart,
  bagMain,
  NULL AS bagMainLot,
  NULL AS bagMainExpires,
  bagSecondary,
  NULL AS bagSecondaryLot,
  NULL AS bagSecondaryExpires,
  timeStart,
  timeEnd,
  CASE
    WHEN cycles = '' OR LEN(cycles) = 0 
    THEN NULL
    ELSE cycles
  END AS cycles,
  systemError,
  CASE
    WHEN manualDrain = 'Yes'
    THEN 1
    ELSE 0
  END AS manualDrain,
  CASE
    WHEN transferSet = 'Yes' 
    THEN 1
    ELSE 0
  END AS transferSet,
  iDrain,
  totalUF,
  avgDwell,
  addDwell,
  CASE 
    WHEN dwellindicator = '+' OR dwellIndicator = 'Yes'
    THEN 1
    ELSE 0
  END AS dwellIndicator,
  '[dialysis_hpc]' AS ShortDescription,
  dateCreated,
  dateModified,
  'pat0000' AS createdBy,
  'pat0000' AS modifiedBy
FROM source.dialysis_hpc

SELECT *
FROm dbo.dialysis_hpc;
GO

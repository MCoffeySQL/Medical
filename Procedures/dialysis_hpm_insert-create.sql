
USE medical;
GO

SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
GO

DROP PROCEDURE IF EXISTS dbo.dialysis_hpm_insert;
GO

CREATE OR ALTER PROCEDURE dbo.dialysis_hpm_insert
  @isActive TINYINT,
  @idPatient NVARCHAR(24),
  @dateDialysis DATETIME,
  @bag NVARCHAR(24),
  @bagLot NVARCHAR(24),
  @bagExpires DATE,
  @timeStart DATETIME,
  @timeEnd DATETIME,
  @volFill NUMERIC(8,2),
  @volDrain NUMERIC(8,2),
  @timeFill TIME,
  @timeDrain TIME,
  @drainClear TINYINT,
  @transferSet TINYINT,
  @shortDescription NVARCHAR(255)
AS
BEGIN
  SET NOCOUNT ON;

  DECLARE
    @dateCreated DATETIME,
    @dateModified DATETIME,
    @createdBy NVARCHAR(24),
    @modifiedBy NVARCHAR(24),
    @message NVARCHAR(255)

  --idPatient
  IF @idPatient IS NULL OR LEN(LTRIM(RTRIM(@idPatient))) = 0
    SET @idPatient = 'pat0000';

  --isActive
  IF @isActive IS NULL
    SET @isActive = 1;

  --date
  IF @dateDialysis IS NULL
    SET @dateDialysis = GETDATE()
  
  --shortDescription
  IF @shortDescription IS NULL OR LEN(LTRIM(RTRIM(@shortDescription))) = 0 
    SET @shortDescription = 'dialysis_hpc';

  --dateCreated
  IF @dateCreated is NULL OR LEN(LTRIM(RTRIM(CAST(@dateCreated AS NVARCHAR)))) = 0
    SET @dateCreated = GETDATE();

  --dateModified
  IF @dateModified IS NULL OR LEN(LTRIM(RTRIM(CAST(@dateModified AS NVARCHAR)))) = 0
    SET @dateModified = GETDATE();

  --createdBy
  IF @createdBy IS NULL OR LEN(LTRIM(RTRIM(@createdBy))) = 0
    SET @createdBy = 'pat0000';

  --modifiedBy
  IF @modifiedBy IS NULL OR LEN(LTRIM(RTRIM(@modifiedBy))) = 0
    SET @modifiedBy = 'pat0000';

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
  VALUES(
    @idPatient,
    @isActive,
    @dateDialysis,
    @bag,
    @bagLot,
    @bagExpires,
    @timeStart,
    @timeEnd,
    @volFill,
    @volDrain,
    @timeFill,
    @timeDrain,
    @drainClear,
    @transferset,
    @shortDescription,
    @dateCreated,
    @dateModified,
    @createdBy,
    @modifiedBy
  );
END
GO

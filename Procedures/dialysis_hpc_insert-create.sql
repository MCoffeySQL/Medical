
USE medical;
GO

SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
GO

DROP PROCEDURE IF EXISTS dbo.dialysis_hpc_insert;
GO

CREATE OR ALTER PROCEDURE dbo.dialysis_hpc_insert
  @isActive TINYINT,
  @idPatient NVARCHAR(24),
  @dateDialysis DATE,
  @bag1 NVARCHAR(24),
  @bag2 NVARCHAR(24),
  @bag1Lot NVARCHAR(24),
  @bag2Lot NVARCHAR(24),
  @bag1Exp DATE,
  @bag2Exp DATE,
  @timeStart DATETIME,
  @timeEnd DATETIME,
  @cycles TINYINT,
  @systemError NVARCHAR(24),
  @manualDrain TINYINT,
  @transferSet TINYINT,
  @iDrain INT,
  @totalUF INT,
  @avgDwell TIME,
  @addDwell TIME,
  @addDwellInd NVARCHAR(2),
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
    SET @idPatient = 'pat35700';

  --isActive
  IF @isActive IS NULL
    SET @isActive = 1;

  --dateDiaysis
  IF @dateDialysis IS NULL
    SET @dateDialysis = GETDATE();

  --bag1
  IF @bag1 NOT IN('Red','Yellow','Green','Purple')
  BEGIN
    SET @message = 'Bag1 is invalid';
    RAISERROR(@message,0,1)WITH NOWAIT;
    RETURN;
  END

  --bag2
  IF @bag2 NOT IN('Red','Yellow','Green','Purple')
  BEGIN
    SET @message = 'Bag2 is invalid';
    RAISERROR(@message,0,1)WITH NOWAIT;
    RETURN;
  END

  --bag1Exp
  IF @bag1Exp <= CAST(GETDATE() AS DATE)
  BEGIN
    SET @message = 'Bag1 has expired';
    RAISERROR(@message,0,1)WITH NOWAIT;
    RETURN;
  END

  --bag2Exp
  IF @bag2Exp <= CAST(GETDATE() AS DATE)
  BEGIN
    SET @message = 'Bag2 has expired';
    RAISERROR(@message,0,1)WITH NOWAIT;
    RETURN;
  END


  --manual drain
  IF @manualDrain IS NULL
    SET @manualDrain = 0;

  --transferset
  IF @transferset IS NULL
    SET @transferset = 0;

  --system error
  IF @systemError IS NULL
    SET @systemError = 0;

  --addDwellInd
  IF @addDwellInd IS NULL OR LEN(LTRIM(RTRIM(@addDwellInd)) + '') = 0
    SET @addDwellInd = '-';
  
  --shortDescription
  IF @shortDescription IS NULL OR LEN(LTRIM(RTRIM(@shortDescription + ''))) = 0 
    SET @shortDescription = '[dialysis_hpc]';

  --dateCreated
  IF @dateCreated is NULL OR LEN(LTRIM(RTRIM(CAST(@dateCreated AS NVARCHAR))) + '') = 0
    SET @dateCreated = GETDATE();

  --dateModified
  IF @dateModified IS NULL OR LEN(LTRIM(RTRIM(CAST(@dateModified AS NVARCHAR))) + '') = 0
    SET @dateModified = GETDATE();

  --createdBy
  IF @createdBy IS NULL OR LEN(LTRIM(RTRIM(@createdBy)) + '') = 0
    SET @createdBy = SUSER_SNAME();

  --modifiedBy
  IF @modifiedBy IS NULL OR LEN(LTRIM(RTRIM(@modifiedBy)) + '') = 0
    SET @modifiedBy = SUSER_SNAME();

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
  VALUES(
    @idPatient,
    @isActive,
    @dateDialysis,
    @bag1,
    @bag1Lot,
    @bag1Exp,
    @bag2,
    @bag2Lot,
    @bag2Exp,
    @timeStart,
    @timeEnd,
    @cycles,
    @systemError,
    @manualDrain,
    @transferSet,
    @iDrain,
    @totalUF,
    @avgDwell,
    @addDwell,
    @addDwellInd,
    @shortDescription,
    @dateCreated,
    @dateModified,
    @createdBy,
    @modifiedBy
  );
END
GO


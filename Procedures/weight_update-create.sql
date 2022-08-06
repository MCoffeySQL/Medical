
USE Medical;
GO

SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
GO

DROP PROCEDURE IF EXISTS dbo.weight_update;
GO

CREATE OR ALTER PROCEDURE dbo.weight_update
  @id INT,
  @isActive TINYINT,
  @idPatient NVARCHAR(24),
  @dateWeight DATETIME,
  @weight NUMERIC(8,2),
  @weightUnit NVARCHAR(2),
  @weightDry TINYINT,
  @bmi NUMERIC(8,2),
  @water NUMERIC(8,2),
  @bodyFat NUMERIC(8,2),
  @muscleMass NUMERIC(8,2),
  @boneDensity NUMERIC(8,2),
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

  IF @dateWeight IS NULL
    SET @dateWeight = GETDATE()

  IF @weightUnit IS NULL OR LEN(LTRIM(RTRIM(@weightUnit))) = 0
    SET @weightUnit = 'kg';

  --weightDry
  IF @weightDry IS NULL
    SET @weightDry = -1;
  
  --shortDescription
  IF @shortDescription IS NULL OR LEN(LTRIM(RTRIM(@shortDescription))) = 0 
    SET @shortDescription = 'dialysis_hpm';

  --dateCreated
  IF @dateCreated is NULL OR LEN(LTRIM(RTRIM(CAST(@dateCreated AS NVARCHAR)))) = 0
    SET @dateCreated = GETDATE();

  --dateModified
  IF @dateModified IS NULL OR LEN(LTRIM(RTRIM(CAST(@dateModified AS NVARCHAR)))) = 0
    SET @dateModified = GETDATE();

  --createdBy
  IF @createdBy IS NULL OR LEN(LTRIM(RTRIM(@createdBy))) = 0
    SET @createdBy = SUSER_SNAME();

  --modifiedBy
  IF @modifiedBy IS NULL OR LEN(LTRIM(RTRIM(@modifiedBy))) = 0
    SET @modifiedBy = SUSER_SNAME();

  UPDATE dbo.[weight]
    SET isActive = 1 ,
    idPatient = @idPatient,
    dateWeight = @dateWeight,
    [weight]= @weight,
    weightUnit = @weightUnit,
    weightDry = @weightDry,
    bmi = @bmi,
    water = @water,
    bodyFat = @bodyFat,
    muscleMass = @muscleMass,
    boneDensity = @boneDensity,
    shortDescription = @shortDescription,
    dateCreated = @dateCreated,
    dateModified = @dateModified,
    createdBy = @createdBy,
    modifiedBy = @modifiedBy
  WHERE id = @id;
END
GO


USE Medical;
GO

SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
GO

DROP PROCEDURE IF EXISTS dbo.bp_update;
GO

CREATE OR ALTER PROCEDURE dbo.bp_update
  @id INT,
  @isActive TINYINT = 1,
  @idPatient NVARCHAR(24),
  @dateBP DATETIME,
  @position NVARCHAR(24),
  @systolic INT,
  @diastolic INT,
  @pulse INT,
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

  IF @dateBP IS NULL
    SET @dateBP = GETDATE()

  --position
  IF @position IS NULL
  BEGIN
    SET @message = 'Position is a required value.';
    RAISERROR(@message,0,1)WITH NOWAIT;
    RETURN;
  END
  
  --shortDescription
  IF @shortDescription IS NULL OR LEN(LTRIM(RTRIM(@shortDescription))) = 0 
    SET @shortDescription = '[bp][bp_update]';

  --dateModified
  IF @dateModified IS NULL OR LEN(LTRIM(RTRIM(CAST(@dateModified AS NVARCHAR)))) = 0
    SET @dateModified = GETDATE();

  --modifiedBy
  IF @modifiedBy IS NULL OR LEN(LTRIM(RTRIM(@modifiedBy))) = 0
    SET @modifiedBy = 'pat0000';

  UPDATE dbo.bp
    SET isActive = @isActive ,
    idPatient = @idPatient,
    dateBP = @dateBP,
    position = @position,
    systolic = systolic,
    diastolic = diastolic,
    pulse = pulse,
    medication = medication,
    shortDescription = @shortDescription,
    dateModified = @dateModified,
    modifiedBy = @modifiedBy
  WHERE id = @id;
END
GO

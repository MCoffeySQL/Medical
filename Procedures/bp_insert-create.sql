USE medical;
GO

DROP PROCEDURE IF EXISTS dbo.bp_insert;
GO

CREATE OR ALTER PROCEDURE dbo.bp_insert
  @isActive TINYINT = 1,
  @idPatient NVARCHAR(24),
  @dateBP DATETIME,
  @position NVARCHAR(24),
  @systolic INT,
  @diastolic INT,
  @pulse INT
AS
BEGIN

  DECLARE
    @v_isActive TINYINT,
    @v_idPatient NVARCHAR(24),
    @v_dateBP DATETIME,
    @v_position NVARCHAR(24),
    @v_systolic INT,
    @v_diastolic INT,
    @v_pulse INT,
    @message NVARCHAR(255)

  SET @v_isActive = @isActive;
  SET @v_idPatient = @idPatient;
  SET @v_dateBP = @dateBP;
  SET @v_position = @position;
  SET @v_systolic = @systolic;
  SET @v_diastolic = @diastolic;

  INSERT INTO dbo.bp(
    isActive,
    idPatient,
    dateBP,
    [position],
    systolic,
    diastolic,
    pulse,
    shortDescription
  )
  VALUES(
    @v_isActive,
    @v_idPatient,
    @v_dateBP,
    @v_position,
    @v_systolic,
    @v_diastolic,
    @v_pulse,
    '[bp][proc:bp_insert]'
  );

  RETURN 1;
END
GO
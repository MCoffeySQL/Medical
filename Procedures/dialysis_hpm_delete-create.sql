
USE medical;
GO

SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
GO

DROP PROCEDURE IF EXISTS dbo.dialysis_hpm_delete;
GO

CREATE OR ALTER PROCEDURE dbo.dialysis_hpm_delete
  @id INT
AS
BEGIN
  SET NOCOUNT ON;

  DECLARE
    @message NVARCHAR(255),
    @isActive TINYINT = 0,
    @shortDescription NVARCHAR(255) = '!!DELETED ',
    @dateModified DATETIME = GETDATE(),
    @modifiedBy NVARCHAR(244) = SUSER_SNAME()

  --id
  IF @id IS NULL
  BEGIN
    SET @message = 'Must provide an ID';
    RAISERROR(@message,0,1)WITH NOWAIT;
    RETURN;  --exit
  END

  UPDATE dbo.dialysis_hpm
  SET
    isActive = @isActive,
    shortDescription = @shortDescription,
    dateModified = @dateModified,
    modifiedBy = @modifiedby
  WHERE id = @id;
END
GO

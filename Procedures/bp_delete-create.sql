USE medical;
GO

DROP PROCEDURE IF EXISTS dbo.bp_delete;
GO

CREATE OR ALTER PROCEDURE dbo.bp_delete
  @id INT
AS
BEGIN
  UPDATE dbo.bp
  SET isActive = -1
  WHERE id = @id;

  RETURN 1;
END
GO
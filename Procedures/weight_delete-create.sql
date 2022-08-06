USE medical;
GO

DROP PROCEDURE IF EXISTS dbo.weight_delete;
GO

CREATE OR ALTER PROCEDURE dbo.weight_delete
  @id INT
AS
BEGIN
  UPDATE dbo.[weight]
  SET isActive = -1
  WHERE id = @id;

  RETURN 1;
END
GO
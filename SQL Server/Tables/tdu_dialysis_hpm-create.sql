USE Medical
GO

DROP TABLE IF EXISTS dbo.tdu_dialysis_hpm;
GO

CREATE TABLE dbo.tdu_dialysis_hpm (
  id INT IDENTITY(1,1) NOT NULL,
  idDialysis INT NULL,
  isActive NVARCHAR(8) NOT NULL,
  [session] INT NULL,
  bag NVARCHAR(24) NULL,
  bagExpires  DATETIME NULL,
  bagLot  NVARCHAR(24) NULL,
  timeDrainStart  DATETIME NULL,
  timeDrainEnd DATETIME NULL,
  volDrain NUMERIC(10,4) NULL,
  timeFillStart DATETIME NULL,
  timeFillEnd DATETIME NULL,
  volFillStart NUMERIC(10,4) NULL,
  volFillEnd NUMERIC(10,4) NULL,
  volFill NUMERIC(10,4) NULL,
  drainClear  NVARCHAR(8) NULL,
  transferSet NVARCHAR(8) NULL,
  shortDescription NVARCHAR(255) NULL,
  dateCreated DATETIME NULL,
  dateModified DATETIME NULL,
  createdBy NVARCHAR(60) NULL,
  modifiedBy NVARCHAR(60) NULL
  );
GO

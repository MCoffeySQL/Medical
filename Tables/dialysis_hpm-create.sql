--TABLE [dbo].[dialysis_hpm]
USE medical;
GO

SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
GO

DROP TABLE IF EXISTS dbo.dialysis_hpm;
GO

CREATE TABLE dbo.dialysis_hpm(
  id INT IDENTITY(1,1) NOT NULL,
  idPatient NVARCHAR(24) NOT NULL,
  isActive TINYINT NOT NULL,
  dateDialysis DATETIME NOT NULL,
  bag NVARCHAR(24) NOT NULL,
  bagLot NVARCHAR(24) NULL,
  bagExp DATE NULL,
  timeStart DATETIME NOT NULL,
  timeEnd DATETIME NULL,
  volFill DECIMAL(8,2) NULL,
  volDrain DECIMAL(8,2) NULL,
  timeFill TIME NULL,
  timeDrain TIME NULL,
  drainClear TINYINT NULL,
  transferSet TINYINT NULL,
  shortDescription NVARCHAR(255) NOT NULL,
  dateCreated DATETIME NOT NULL,
  dateModified DATETIME NOT NULL,
  createdBy NVARCHAR(60) NOT NULL,
  modifiedBy NVARCHAR(60) NOT NULL
);
GO
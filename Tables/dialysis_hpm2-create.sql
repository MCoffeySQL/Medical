USE Medical;
GO

DROP TABLE IF EXISTS dbo.dialysis_hpm2;
GO

CREATE TABLE dbo.dialysis_hpm2(
  id INT IDENTITY(1,1) NOT NULL,
  idPatient NVARCHAR(24) NOT NULL,
  isActive TINYINT NOT NULL,
  timeStart DATETIME NOT NULL,
  timeEnd DATETIME NOT NULL,
  bag NVARCHAR(24) NOT NULL,
  volume DECIMAL(6,3) NOT NULL,
  [action] NVARCHAR(24) NOT NULL,
  timeElapsed TIME NULL,
  drainClear TINYINT NULL,
  transferSet TINYINT NULL,
  volumeIndicator NVARCHAR(2) NULL,
  shortDescription NVARCHAR(255) NULL,
  dateCreated DATETIME NOT NULL,
  dateModified DATETIME NOT NULL,
  createdBy NVARCHAR(24) NOT NULL,
  modifiedBY NVARCHAR(24) NOT NULL
);
GO
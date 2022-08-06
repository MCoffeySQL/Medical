--TABLE: [dbo].[weight]
USE medical;
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

DROP TABLE IF EXISTS dbo.[weight];
GO

CREATE TABLE dbo.[weight](
  ID INT IDENTITY(1,1)NOT NULL,
  idPatient NVARCHAR(24) NOT NULL,
  isActive TINYINT NOT NULL,
  dateWeight DATETIME NOT NULL,
  [weight] NUMERIC(8,2) NOT NULL,
  weightUnit NVARCHAR(2) NOT NULL,
  weightDry TINYINT NOT NULL,
  bmi NUMERIC(8,2) NULL,
  water NUMERIC(8,2) NULL,
  bodyFat NUMERIC(8,2) NULL,
  muscleMass NUMERIC(8,2) NULL,
  boneDensity NUMERIC(8,2) NULL,
  shortDescription NVARCHAR(255) NULL,
  dateCreated DATETIME NOT NULL,
  dateModified DATETIME NOT NULL,
  createdBy NVARCHAR(24) NOT NULL,
  modifiedBy NVARCHAR(24) NOT NULL
);
GO
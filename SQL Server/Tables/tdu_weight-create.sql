USE Medical;
GO

DROP TABLE IF EXISTS dbo.tdu_weight;
GO

CREATE TABLE dbo.tdu_weight(
  id INT IDENTITY(1,1) NOT NULL,
  idPatient NVARCHAR(60) NOT NULL,
  isActive NVARCHAR(8) NOT NULL,
  dateWeight DATETIME NOT NULL,
  [weight] NUMERIC(10,4) NOT NULL,
  unitWeight NVARCHAR(8) NULL,
  weightDry NVARCHAR(8) NULL,
  bmi NUMERIC(10,4) NULL,
  water NUMERIC(10,4) NULL,
  bodyFat NUMERIC(10,4) NULL,
  muscleMass NUMERIC(10,4) NULL,
  boneDensity NUMERIC(10,4) NULL,
  shortDescription NVARCHAR(255) NULL,
  dateCreated DATETIME NULL,
  dateModified DATETIME NULL,
  createdBy NVARCHAR(60) NULL,
  modifiedBy NVARCHAR(60) NULL
);
GO
USE Medical;
GO

DROP TABLE IF EXISTS dbo.tdu_symptom;
GO

CREATE TABLE dbo.tdu_symptom(
  id INT IDENTITY(1,1) NOT NULL,
  idPatient NVARCHAR(60) NOT NULL,
  idSymptom INT NOT NULL,
  isActive NVARCHAR(8) NOT NULL,
  dateSymptom DATETIME NOT NULL,
  timeStart DATETIME NULL,
  timeEnd DATETIME NULL,
  shortDescription NVARCHAR(255) NULL,
  dateCreated DATETIME NULL,
  dateModified DATETIME NULL,
  createdBy NVARCHAR(60) NULL,
  modifiedBy NVARCHAR(60) NULL
);
GO
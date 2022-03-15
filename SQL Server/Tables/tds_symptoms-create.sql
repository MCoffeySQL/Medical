USE Medical;
GO

DROP TABLE IF EXISTS dbo.tds_symptoms;
GO

CREATE TABLE dbo.tds_symptoms(
  id INT IDENTITY(1,1) NOT NULL,
  isActive NVARCHAR(8) NOT NULL,
  symptom NVARCHAR(60) NOT NULL,
  shortDescription NVARCHAR(255) NULL,
  dateCreated DATETIME NOT NULL,
  dateModified DATETIME NOT NULL,
  createdBy NVARCHAR(60) NOT NULL,
  modifiedBy NVARCHAR(60) NOT NULL
);
GO

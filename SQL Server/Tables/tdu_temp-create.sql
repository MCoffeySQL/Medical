USE Medical;
GO

DROP TABLE IF EXISTS dbo.tdu_temp;
GO

CREATE TABLE dbo.tdu_temp(
  id INT IDENTITY(1,1) NOT NULL,
  idPatient NVARCHAR(60) NOT NULL,
  isActive NVARCHAR(8) NOT NULL,
  dateTemp DATETIME NOT NULL,
  temp NUMERIC(10,4) NOT NULL,
  unitTemp NVARCHAR(8) NULL,
  shortDescription NVARCHAR(255) NULL,
  dateCreated DATETIME NULL,
  dateModified DATETIME NULL,
  modifiedBy NVARCHAR(60) NULL,
  createdBy NVARCHAR(60) NULL
);
GO
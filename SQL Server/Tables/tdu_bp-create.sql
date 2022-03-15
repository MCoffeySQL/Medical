USE Medical
GO

DROP TABLE IF EXISTS dbo.tdu_bp;
GO

CREATE TABLE dbo.tdu_bp (
  id INT IDENTITY(1,1) NOT NULL,
  isActive NVARCHAR(8) NOT NULL,
  idPatient NVARCHAR(60) NULL,
  dateBP DATETIME NULL,
  position NVARCHAR(24) NULL,
  systolic INT NULL,
  diastolic INT NULL,
  pulse INT NULL,
  medication NVARCHAR(8) NULL,
  shortDescription NVARCHAR(255) NULL,
  dateCreated DATETIME NULL,
  dateModified DATETIME NULL,
  createdBy NVARCHAR(60) NULL,
  modifiedBY NVARCHAR(60) NULL
  );
GO

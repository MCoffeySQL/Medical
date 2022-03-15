USE Medical;
GO

DROP TABLE IF EXISTS tds_dialysis_mode;
GO

CREATE TABLE tds_dialysis_mode(
  id INT IDENTITY(1,1) NOT NULL,
  isActive NVARCHAR(8) NOT NULL,
  dialysisMode NVARCHAR(60) NOT NULL,
  shortDescription NVARCHAR(255) NULL,
  dateCreated DATETIME NOT NULL,
  dateModified DATETIME NOT NULL,
  createdBy NVARCHAR(60) NOT NULL,
  modifiedBy NVARCHAR(60) NOT NULL
);
GO
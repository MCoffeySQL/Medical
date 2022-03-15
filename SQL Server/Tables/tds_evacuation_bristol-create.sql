USE Medical;
GO

DROP TABLE IF EXISTS dbo.tds_evacuation_bristol;
GO

CREATE TABLE dbo.tds_evacuation_bristol(
  id INT IDENTITY(1,1) NOT NULL,
  isActive NVARCHAR(8) NOT NULL,
  depiction NVARCHAR(60) NOT NULL,
  conclusion NVARCHAR(60) NULL,
  shortDescription NVARCHAR(255) NULL,
  dateCreated DATETIME NOT NULL,
  dateModified DATETIME NOT NULL,
  createdBY NVARCHAR(255) NOT NULL,
  modifiedBY NVARCHAR(255) NOT NULL
);
GO
--TABLE: [dbo].[notesRelation]

USE medical;
GO

IF EXISTS(SELECT 1 FROM sys.tables WHERE [name] = 'notesRelation')
BEGIN
  ALTER TABLE dbo.notesRelation
  DROP CONSTRAINT IF EXISTS fk_notesRelation$idNote;
END

DROP TABLE IF EXISTS dbo.[notes];
GO

CREATE TABLE dbo.[notes](
  id INT IDENTITY(1,1)NOT NULL,
  idPatient NVARCHAR(24) NOT NULL,
  isActive TINYINT NOT NULL,
  dateNote DATETIME NOT NULL,
  note NVARCHAR(MAX) NOT NULL,
  shortDescription NVARCHAR(255) NULL,
  dateCreated DATETIME NOT NULL,
  dateModified DATETIME NOT NULL,
  createdBy NVARCHAR(24) NOT NULL,
  modifiedBy NVARCHAR(24) NOT NULL
);
GO
--TABLE [dbo].[bp]
--ALTER TABLE
USE medical;
GO

--primary key (id)
ALTER TABLE [bp]
  DROP CONSTRAINT IF EXISTS pk_bp;
GO

ALTER TABLE [bp]
  ADD CONSTRAINT pk_bp PRIMARY KEY CLUSTERED (id);
GO

--default (idPatient)
ALTER TABLE [bp]
  DROP CONSTRAINT IF EXISTS dv_bp$idPatient;
GO

ALTER TABLE [bp]
  ADD CONSTRAINT dv_bp$idPatient
  DEFAULT 'pat0000'
  FOR idPatient;
GO

--default (isActive)
ALTER TABLE [bp]
  DROP CONSTRAINT IF EXISTS dv_bp$isActive;
GO

ALTER TABLE [bp]
  ADD CONSTRAINT dv_bp$isActive
  DEFAULT 1
  FOR isActive;
GO

--default (datebp)
ALTER TABLE [bp]
  DROP CONSTRAINT IF EXISTS dv_bp$dateBP;
GO

ALTER TABLE [bp]
  ADD CONSTRAINT dv_bp$dateBP
  DEFAULT GETDATE()
  FOR dateBP;
GO

--check on [position]
ALTER TABLE [bp]
  DROP CONSTRAINT IF EXISTS ck_bp$position;

ALTER TABLE [bp]
  ADD CONSTRAINT ck_bp$position
  CHECK (position IN('standing','sitting','laying'));

--default (shortDescription)
ALTER TABLE [bp]
  DROP CONSTRAINT IF EXISTS dv_bp$shortDescription;
GO

ALTER TABLE [bp]
  ADD CONSTRAINT dv_bp$shortDescription
  DEFAULT '[bp]'
  FOR shortDescription;
GO

--default (createdBy)
ALTER TABLE [bp]
  DROP CONSTRAINT IF EXISTS dv_bp$createdBy;
GO

ALTER TABLE [bp]
  ADD CONSTRAINT dv_bp$createdBy
  DEFAULT 'pat0000'
  FOR createdBy;
GO

--default (modifiedBy)
ALTER TABLE [bp]
  DROP CONSTRAINT IF EXISTS dv_bp$modifiedBy;
GO

ALTER TABLE [bp]
  ADD CONSTRAINT dv_bp$modifiedBy
  DEFAULT 'pat0000'
  FOR modifiedBy;
GO

--default (dateCreated)
ALTER TABLE [bp]
  DROP CONSTRAINT IF EXISTS dv_bp$dateCreated;
GO

ALTER TABLE [bp]
  ADD CONSTRAINT dv_bp$dateCreated
  DEFAULT GETDATE()
  FOR dateCreated;
GO

--default (dateModified)
ALTER TABLE [bp]
  DROP CONSTRAINT IF EXISTS dv_bp$dateModified;
GO

ALTER TABLE [bp]
  ADD CONSTRAINT dv_bp$dateModified
  DEFAULT GETDATE()
  FOR dateModified;
GO


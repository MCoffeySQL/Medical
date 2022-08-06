USE medical;
GO

--primary key (id)
ALTER TABLE [notes]
  DROP CONSTRAINT IF EXISTS pk_notes;
GO

ALTER TABLE [notes]
  ADD CONSTRAINT pk_notes PRIMARY KEY CLUSTERED (id);
GO

--default (idPatient)
ALTER TABLE [notes]
  DROP CONSTRAINT IF EXISTS dv_notes$idPatient;
GO

ALTER TABLE [notes]
  ADD CONSTRAINT dv_notes$idPatient
  DEFAULT 'pat0000'
  FOR idPatient;
GO

--default (isActive)
ALTER TABLE [notes]
  DROP CONSTRAINT IF EXISTS dv_notes$isActive;
GO

ALTER TABLE [notes]
  ADD CONSTRAINT dv_notes$isActive
  DEFAULT 1
  FOR isActive;
GO

--default (createdBy)
ALTER TABLE [notes]
  DROP CONSTRAINT IF EXISTS dv_notes$createdBy;
GO

ALTER TABLE [notes]
  ADD CONSTRAINT dv_notes$createdBy
  DEFAULT 'pat000'
  FOR createdBy;
GO

--default (modifiedBy)
ALTER TABLE [notes]
  DROP CONSTRAINT IF EXISTS dv_notes$modifiedBy;
GO

ALTER TABLE [notes]
  ADD CONSTRAINT dv_notes$modifiedBy
  DEFAULT 'pat0000'
  FOR modifiedBy;
GO

--default (dateCreated)
ALTER TABLE [notes]
  DROP CONSTRAINT IF EXISTS dv_notes$dateCreated;
GO

ALTER TABLE [notes]
  ADD CONSTRAINT dv_notes$dateCreated
  DEFAULT GETDATE()
  FOR dateCreated;
GO

--default (dateModified)
ALTER TABLE [notes]
  DROP CONSTRAINT IF EXISTS dv_notes$dateModified;
GO

ALTER TABLE [notes]
  ADD CONSTRAINT dv_notes$dateModified
  DEFAULT GETDATE()
  FOR dateModified;
GO

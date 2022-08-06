USE medical;
GO

--primary key (id)
ALTER TABLE patient
  DROP CONSTRAINT IF EXISTS pk_patient;
GO

ALTER TABLE patient
  ADD CONSTRAINT pk_patient PRIMARY KEY CLUSTERED (id);
GO

--default (isActive)
ALTER TABLE patient
  DROP CONSTRAINT IF EXISTS dv_patient$isActive;
GO

ALTER TABLE patient
  ADD CONSTRAINT dv_patient$isActive
  DEFAULT 1
  FOR isActive;
GO

--default (createdBy)
ALTER TABLE patient
  DROP CONSTRAINT IF EXISTS dv_patient$createdBy;
GO

ALTER TABLE patient
  ADD CONSTRAINT dv_patient$createdBy
  DEFAULT 'pat000'
  FOR createdBy;
GO

--default (modifiedBy)
ALTER TABLE patient
  DROP CONSTRAINT IF EXISTS dv_patient$modifiedBy;
GO

ALTER TABLE patient
  ADD CONSTRAINT dv_patient$modifiedBy
  DEFAULT 'pat0000'
  FOR modifiedBy;
GO

--default (dateCreated)
ALTER TABLE patient
  DROP CONSTRAINT IF EXISTS dv_patient$dateCreated;
GO

ALTER TABLE patient
  ADD CONSTRAINT dv_patient$dateCreated
  DEFAULT GETDATE()
  FOR dateCreated;
GO

--default (dateModified)
ALTER TABLE patient
  DROP CONSTRAINT IF EXISTS dv_patient$dateModified;
GO

ALTER TABLE patient
  ADD CONSTRAINT dv_patient$dateModified
  DEFAULT GETDATE()
  FOR dateModified;
GO

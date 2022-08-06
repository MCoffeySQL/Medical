USE medical;
GO

--primary key (id)
ALTER TABLE dialysis_hpm
  DROP CONSTRAINT IF EXISTS pk_dialysis_hpm;
GO

ALTER TABLE dialysis_hpm
  ADD CONSTRAINT pk_dialysis_hpm PRIMARY KEY CLUSTERED (id);
GO

--default (idPatient)
ALTER TABLE dialysis_hpm
  DROP CONSTRAINT IF EXISTS dv_dialysis_hpm$idPatient;
GO

ALTER TABLE dialysis_hpm
  ADD CONSTRAINT dv_dialysis_hpm$idPatient
  DEFAULT 'Ppat0000'
  FOR idPatient;
GO

--default (isActive)
ALTER TABLE dialysis_hpm
  DROP CONSTRAINT IF EXISTS dv_dialysis_hpm$isActive;
GO

ALTER TABLE dialysis_hpm
  ADD CONSTRAINT dv_dialysis_hpm$isActive
  DEFAULT 1
  FOR isActive;
GO

--default (dateDialysis)
ALTER TABLE dialysis_hpm
  DROP CONSTRAINT IF EXISTS dv_dialysis_hpm$dateDialysis;
GO

ALTER TABLE dialysis_hpm
  ADD CONSTRAINT dv_dialysis_hpm$dateDialysis
  DEFAULT GETDATE()
  FOR dateDialysis;
GO

--default (drainClear)
ALTER TABLE dialysis_hpm
  DROP CONSTRAINT IF EXISTS dv_dialysis_hpm$transferSet;
GO

ALTER TABLE dialysis_hpm
  ADD CONSTRAINT dv_dialysis_hpm$transferSet
  DEFAULT 1
  FOR drainClear;
 GO

--default (transferset)
ALTER TABLE dialysis_hpm
  DROP CONSTRAINT IF EXISTS dv_dialysis_hpm$transferSet;
GO

ALTER TABLE dialysis_hpm
  ADD CONSTRAINT dv_dialysis_hpm$transferSet
  DEFAULT 0
  FOR transferSet;
 GO

--default (shortDescription)
ALTER TABLE dialysis_hpm
  DROP CONSTRAINT IF EXISTS dv_dialysis_hpm$shortDescription;
GO

ALTER TABLE dialysis_hpm
  ADD CONSTRAINT dv_dialysis_hpm$shortDescription
  DEFAULT '[dialysis_hpc]'
  FOR shortDescription;
GO

--default (createdBy)
ALTER TABLE dialysis_hpm
  DROP CONSTRAINT IF EXISTS dv_dialysis_hpm$createdBy;
GO

ALTER TABLE dialysis_hpm
  ADD CONSTRAINT dv_dialysis_hpm$createdBy
  DEFAULT 'pat000'
  FOR createdBy;
GO

--default (modifiedBy)
ALTER TABLE dialysis_hpm
  DROP CONSTRAINT IF EXISTS dv_dialysis_hpm$modifiedBy;
GO

ALTER TABLE dialysis_hpm
  ADD CONSTRAINT dv_dialysis_hpm$modifiedBy
  DEFAULT 'pat0000'
  FOR modifiedBy;
GO

--default (dateCreated)
ALTER TABLE dialysis_hpm
  DROP CONSTRAINT IF EXISTS dv_dialysis_hpm$dateCreated;
GO

ALTER TABLE dialysis_hpm
  ADD CONSTRAINT dv_dialysis_hpm$dateCreated
  DEFAULT GETDATE()
  FOR dateCreated;
GO

--default (dateModified)
ALTER TABLE dialysis_hpm
  DROP CONSTRAINT IF EXISTS dv_dialysis_hpm$dateModified;
GO

ALTER TABLE dialysis_hpm
  ADD CONSTRAINT dv_dialysis_hpm$dateModified
  DEFAULT GETDATE()
  FOR dateModified;
GO

--check on (drainClear)
ALTER TABLE dbo.dialysis_hpm 
  DROP CONSTRAINT IF EXISTS ck_dialysis_hpm$drainClear;
GO

ALTER TABLE dbo.dialysis_hpm
ADD CONSTRAINT ck_dialysis_hpm$drainClear
CHECK (drainClear IN (0,1));
GO

--check on (transferSet)
ALTER TABLE dbo.dialysis_hpm 
  DROP CONSTRAINT IF EXISTS ck_dialysis_hpm$transferSet;
GO

ALTER TABLE dbo.dialysis_hpm
ADD CONSTRAINT ck_dialysis_hpm$transferSet
CHECK (transferSet IN (0,1));
GO

--check on (bag)
ALTER TABLE dbo.dialysis_hpm
  DROP CONSTRAINT IF EXISTS ck_dialysis_hpm$bag;
GO

ALTER TABLE dbo.dialysis_hpm
  ADD CONSTRAINT ck_dialysis_hpm$bag
  CHECK (bag IN ('Yellow','Green','Red','Purple','Other',''));
GO

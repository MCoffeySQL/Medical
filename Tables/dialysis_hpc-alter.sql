USE medical;
GO

--primary key (id)
ALTER TABLE dialysis_hpc
  DROP CONSTRAINT IF EXISTS pk_dialysis_hpc;
GO

ALTER TABLE dialysis_hpc
  ADD CONSTRAINT pk_dialysis_hpc PRIMARY KEY CLUSTERED (id);
GO

--default (idPatient)
ALTER TABLE dialysis_hpc
  DROP CONSTRAINT IF EXISTS dv_dialysis_hpc$idPatient;
GO

ALTER TABLE dialysis_hpc
  ADD CONSTRAINT dv_dialysis_hpc$idPatient
  DEFAULT 'pat0000'
  FOR idPatient;
GO

--default (isActive)
ALTER TABLE dialysis_hpc
  DROP CONSTRAINT IF EXISTS dv_dialysis_hpc$isActive;
GO

ALTER TABLE dialysis_hpc
  ADD CONSTRAINT dv_dialysis_hpc$isActive
  DEFAULT 1
  FOR isActive;
GO

--default (dateDialysis)
ALTER TABLE dialysis_hpc
  DROP CONSTRAINT IF EXISTS dv_dialysis_hpc$dateDialysis;
GO

ALTER TABLE dialysis_hpc
  ADD CONSTRAINT dv_dialysis_hpc$dateDialysis
  DEFAULT GETDATE()
  FOR dateDialysis;
GO

--default (systemError)
ALTER TABLE dialysis_hpc
  DROP CONSTRAINT IF EXISTS dv_dialysis_hpc$systemError;
GO

ALTER TABLE dialysis_hpc
  ADD CONSTRAINT dv_dialysis_hpc$systemError
  DEFAULT 0
  FOR systemError;
GO

--default (manualDrain)
ALTER TABLE dialysis_hpc
  DROP CONSTRAINT IF EXISTS dv_dialysis_hpc$manualDrain;

ALTER TABLE dialysis_hpc
  ADD CONSTRAINT dv_dialysis_hpc$manualDrain
  DEFAULT 0
  FOR manualDrain;
GO

--default (transferset)
ALTER TABLE dialysis_hpc
  DROP CONSTRAINT IF EXISTS dv_dialysis_hpc$transferSet;
GO

ALTER TABLE dialysis_hpc
  ADD CONSTRAINT dv_dialysis_hpc$transferSet
  DEFAULT 0
  FOR transferSet;
 GO

--default (shortDescription)
ALTER TABLE dialysis_hpc
  DROP CONSTRAINT IF EXISTS dv_dialysis_hpc$shortDescription;
GO

ALTER TABLE dialysis_hpc
  ADD CONSTRAINT dv_dialysis_hpc$shortDescription
  DEFAULT '[dialysis_hpc]'
  FOR shortDescription;
GO

--default (createdBy)
ALTER TABLE dialysis_hpc
  DROP CONSTRAINT IF EXISTS dv_dialysis_hpc$createdBy;
GO

ALTER TABLE dialysis_hpc
  ADD CONSTRAINT dv_dialysis_hpc$createdBy
  DEFAULT 'pat0000'
  FOR createdBy;
GO

--default (modifiedBy)
ALTER TABLE dialysis_hpc
  DROP CONSTRAINT IF EXISTS dv_dialysis_hpc$modifiedBy;
GO

ALTER TABLE dialysis_hpc
  ADD CONSTRAINT dv_dialysis_hpc$modifiedBy
  DEFAULT 'pat0000'
  FOR modifiedBy;
GO

--default (dateCreated)
ALTER TABLE dialysis_hpc
  DROP CONSTRAINT IF EXISTS dv_dialysis_hpc$dateCreated;
GO

ALTER TABLE dialysis_hpc
  ADD CONSTRAINT dv_dialysis_hpc$dateCreated
  DEFAULT GETDATE()
  FOR dateCreated;
GO

--default (dateModified)
ALTER TABLE dialysis_hpc
  DROP CONSTRAINT IF EXISTS dv_dialysis_hpc$dateModified;
GO

ALTER TABLE dialysis_hpc
  ADD CONSTRAINT dv_dialysis_hpc$dateModified
  DEFAULT GETDATE()
  FOR dateModified;
GO

--check on (manualDrain)
ALTER TABLE dbo.dialysis_hpc 
  DROP CONSTRAINT IF EXISTS ck_dialysis_hpc$manualDrain;
GO

ALTER TABLE dbo.dialysis_hpc
ADD CONSTRAINT ck_dialysis_hpc$manualDrain
CHECK (manualDrain IN (0,1));
GO

--check on (transferSet)
ALTER TABLE dbo.dialysis_hpc 
  DROP CONSTRAINT IF EXISTS ck_dialysis_hpc$transferSet;
GO

ALTER TABLE dbo.dialysis_hpc
ADD CONSTRAINT ck_dialysis_hpc$transferSet
CHECK (transferSet IN (0,1));
GO

--check on (bag1)
ALTER TABLE dbo.dialysis_hpc
  DROP CONSTRAINT IF EXISTS ck_dialysis_hpc$bag1;
GO

ALTER TABLE dbo.dialysis_hpc
  ADD CONSTRAINT ck_dialysis_hpc$bag1
  CHECK (bag1 IN ('Yellow','Green','Red','Purple','Other',''));
GO

--check on (bag2)
ALTER TABLE dbo.dialysis_hpc
  DROP CONSTRAINT IF EXISTS ck_dialysis_hpc$bag2;
GO

ALTER TABLE dbo.dialysis_hpc
  ADD CONSTRAINT ck_dialysis_hpc$bag2
  CHECK (bag2 IN ('Yellow','Green','Red','Purple','Other',''));
GO
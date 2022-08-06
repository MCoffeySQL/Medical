--TABLE [dbo].[Temp]
--ALTER TABLE
USE medical;
GO

--primary key (id)
ALTER TABLE [temp]
  DROP CONSTRAINT IF EXISTS pk_temp;
GO

ALTER TABLE [temp]
  ADD CONSTRAINT pk_temp PRIMARY KEY CLUSTERED (id);
GO

--default (idPatient)
ALTER TABLE [temp]
  DROP CONSTRAINT IF EXISTS dv_temp$idPatient;
GO

ALTER TABLE [temp]
  ADD CONSTRAINT dv_temp$idPatient
  DEFAULT 'pat0000'
  FOR idPatient;
GO

--default (isActive)
ALTER TABLE [temp]
  DROP CONSTRAINT IF EXISTS dv_temp$isActive;
GO

ALTER TABLE [temp]
  ADD CONSTRAINT dv_temp$isActive
  DEFAULT 1
  FOR isActive;
GO

--default (datetemp)
ALTER TABLE [temp]
  DROP CONSTRAINT IF EXISTS dv_temp$dateTemp;
GO

ALTER TABLE [temp]
  ADD CONSTRAINT dv_temp$dateTemp
  DEFAULT GETDATE()
  FOR datetemp;
GO

--default (tempUnit)
ALTER TABLE [temp]
  DROP CONSTRAINT IF EXISTS dv_temp$tempUnit;
GO

ALTER TABLE [temp]
  ADD CONSTRAINT dv_temp$tempUnit
  DEFAULT 'F'
  FOR tempUnit;
 GO

--default (shortDescription)
ALTER TABLE [temp]
  DROP CONSTRAINT IF EXISTS dv_temp$shortDescription;
GO

ALTER TABLE [temp]
  ADD CONSTRAINT dv_temp$shortDescription
  DEFAULT '[temp]'
  FOR shortDescription;
GO

--default (createdBy)
ALTER TABLE [temp]
  DROP CONSTRAINT IF EXISTS dv_temp$createdBy;
GO

ALTER TABLE [temp]
  ADD CONSTRAINT dv_temp$createdBy
  DEFAULT 'pat0000'
  FOR createdBy;
GO

--default (modifiedBy)
ALTER TABLE [temp]
  DROP CONSTRAINT IF EXISTS dv_temp$modifiedBy;
GO

ALTER TABLE [temp]
  ADD CONSTRAINT dv_temp$modifiedBy
  DEFAULT 'pat0000'
  FOR modifiedBy;
GO

--default (dateCreated)
ALTER TABLE [temp]
  DROP CONSTRAINT IF EXISTS dv_temp$dateCreated;
GO

ALTER TABLE [temp]
  ADD CONSTRAINT dv_temp$dateCreated
  DEFAULT GETDATE()
  FOR dateCreated;
GO

--default (dateModified)
ALTER TABLE [temp]
  DROP CONSTRAINT IF EXISTS dv_temp$dateModified;
GO

ALTER TABLE [temp]
  ADD CONSTRAINT dv_temp$dateModified
  DEFAULT GETDATE()
  FOR dateModified;
GO

--check on (tempUnit)
ALTER TABLE dbo.[temp] 
  DROP CONSTRAINT IF EXISTS ck_temp$tempUnit;
GO

ALTER TABLE dbo.[temp]
ADD CONSTRAINT ck_temp$tempUnit
CHECK (tempUnit IN ('C','F','K'));
GO


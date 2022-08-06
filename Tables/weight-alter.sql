--TABLE [dbo].[Weight]
--ALTER TABLE

USE medical;
GO

--primary key (id)
ALTER TABLE [weight]
  DROP CONSTRAINT IF EXISTS pk_weight;
GO

ALTER TABLE [weight]
  ADD CONSTRAINT pk_weight PRIMARY KEY CLUSTERED (id);
GO

--default (idPatient)
ALTER TABLE [weight]
  DROP CONSTRAINT IF EXISTS dv_weight$idPatient;
GO

ALTER TABLE [weight]
  ADD CONSTRAINT dv_weight$idPatient
  DEFAULT 'pat0000'
  FOR idPatient;
GO

--default (isActive)
ALTER TABLE [weight]
  DROP CONSTRAINT IF EXISTS dv_weight$isActive;
GO

ALTER TABLE [weight]
  ADD CONSTRAINT dv_weight$isActive
  DEFAULT 1
  FOR isActive;
GO

--default (date)
ALTER TABLE [weight]
  DROP CONSTRAINT IF EXISTS dv_weight$dateWeight;
GO

ALTER TABLE [weight]
  ADD CONSTRAINT dv_weight$dateWeight
  DEFAULT GETDATE()
  FOR dateWeight;
GO

--default (weightUnit)
ALTER TABLE [weight]
  DROP CONSTRAINT IF EXISTS dv_weight$weightUnit;
GO

ALTER TABLE [weight]
  ADD CONSTRAINT dv_weight$weightUnit
  DEFAULT 'kg'
  FOR weightUnit;
 GO

--default (shortDescription)
ALTER TABLE [weight]
  DROP CONSTRAINT IF EXISTS dv_weight$shortDescription;
GO

ALTER TABLE [weight]
  ADD CONSTRAINT dv_weight$shortDescription
  DEFAULT '[weight]'
  FOR shortDescription;
GO

--default (createdBy)
ALTER TABLE [weight]
  DROP CONSTRAINT IF EXISTS dv_weight$createdBy;
GO

ALTER TABLE [weight]
  ADD CONSTRAINT dv_weight$createdBy
  DEFAULT 'pat0000'
  FOR createdBy;
GO

--default (modifiedBy)
ALTER TABLE [weight]
  DROP CONSTRAINT IF EXISTS dv_weight$modifiedBy;
GO

ALTER TABLE [weight]
  ADD CONSTRAINT dv_weight$modifiedBy
  DEFAULT 'pat0000'
  FOR modifiedBy;
GO

--default (dateCreated)
ALTER TABLE [weight]
  DROP CONSTRAINT IF EXISTS dv_weight$dateCreated;
GO

ALTER TABLE [weight]
  ADD CONSTRAINT dv_weight$dateCreated
  DEFAULT GETDATE()
  FOR dateCreated;
GO

--default (dateModified)
ALTER TABLE [weight]
  DROP CONSTRAINT IF EXISTS dv_weight$dateModified;
GO

ALTER TABLE [weight]
  ADD CONSTRAINT dv_weight$dateModified
  DEFAULT GETDATE()
  FOR dateModified;
GO

--check on (weightDry)
ALTER TABLE dbo.[weight] 
  DROP CONSTRAINT IF EXISTS ck_weight$weightDry;
GO

ALTER TABLE dbo.[weight]
ADD CONSTRAINT ck_weight$weightDry
CHECK (weightDry IN (0,1));
GO

--check on (weightUnit)
ALTER TABLE dbo.[weight] 
  DROP CONSTRAINT IF EXISTS ck_weight$weightUnit;
GO

ALTER TABLE dbo.[weight]
ADD CONSTRAINT ck_weight$weightUnit
CHECK (weightUnit IN ('kg','lb','g','st'));
GO


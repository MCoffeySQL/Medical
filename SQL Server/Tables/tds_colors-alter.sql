USE Medical;
GO

--Primary Key on [id]
ALTER TABLE dbo.tds_colors
DROP CONSTRAINT IF EXISTS pk_tdsColors;
GO

ALTER TABLE dbo.tds_colors
  ADD CONSTRAINT pk_tdsColors
  PRIMARY KEY CLUSTERED (id);
GO

--Unique on [colorAlias]
ALTER TABLE dbo.tds_colors
DROP CONSTRAINT IF EXISTS unq_colors_colorAlias;

ALTER TABLE dbo.tds_colors
ADD CONSTRAINT unq_colors_colorAlias
  UNIQUE(colorAlias);

--Default on [isActive]
ALTER TABLE dbo.tds_colors
DROP CONSTRAINT IF EXISTS dv_tdsColors_isActive;
GO

ALTER TABLE dbo.tds_colors
ADD CONSTRAINT dv_tdsColors_isActive
  DEFAULT 'Yes'
  FOR isActive;
GO

--Default on [dateCreated]
ALTER TABLE dbo.tds_colors
DROP CONSTRAINT IF EXISTS dv_tdsColors_dateCreated;
GO

ALTER TABLE dbo.tds_colors
ADD CONSTRAINT dv_tdsColors_dateCreated
  DEFAULT GETDATE()
  FOR dateCreated;
GO

--Default on [dateModified]
ALTER TABLE dbo.tds_colors
DROP CONSTRAINT IF EXISTS dv_tdsColors_dateModified;
GO

ALTER TABLE dbo.tds_colors
ADD CONSTRAINT dv_tdsColors_dateModified
  DEFAULT GETDATE()
  FOR dateModified;
GO

--Default on [createdBy]
ALTER TABLE dbo.tds_colors
DROP CONSTRAINT IF EXISTS dv_tdsColors_createdBy;
GO

ALTER TABLE dbo.tds_colors
ADD CONSTRAINT dv_tdsColors_createdBy
  DEFAULT 'Empty'
  FOR createdBy;
GO

--Default on [modifiedBy]
ALTER TABLE dbo.tds_colors
DROP CONSTRAINT IF EXISTS dv_tdsColors_modifiedBy;
GO

ALTER TABLE dbo.tds_colors
ADD CONSTRAINT dv_tdsColors_modifiedBy
  DEFAULT 'Empty'
  FOR modifiedBy;
 GO
USE Medical;
GO

--Primary Key on [Id]
ALTER TABLE dbo.tdu_bp DROP CONSTRAINT IF EXISTS pk_tdubp;
GO

ALTER TABLE dbo.tdu_bp 
ADD CONSTRAINT pk_tdubp
  PRIMARY KEY CLUSTERED (id);
GO

--Foreign Key on [idPatient]
--ALTER TABLE dbo.tdu_bp DROP CONSTRAINT IF EXISTS fk_tdubp_idPatient;
--GO

--ALTER TABLE dbo.tdu_bp
--ADD CONSTRAINT fk_tdubp_idPatient
--  FOREIGN KEY (idPatient) 
--  REFERENCES dbo.patient(id)
--  ON DELETE NO ACTION
--  ON UPDATE NO ACTION;
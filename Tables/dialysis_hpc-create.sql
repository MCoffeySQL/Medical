--TABLE [dbo].[dialysis_hpc]
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

--drop table 
DROP TABLE IF EXISTS dbo.dialysis_hpc;
GO

--create table
CREATE TABLE dbo.dialysis_hpc(
  id INT IDENTITY(1,1) NOT NULL,
  idPatient NVARCHAR(24) NOT NULL,
  isActive TINYINT NOT NULL,
  dateDialysis DATETIME NOT NULL,
  bag1 NVARCHAR(24) NOT NULL,
  bag2 NVARCHAR(24) NOT NULL,
  bag1Lot NVARCHAR(24) NULL,
  bag2Lot NVARCHAR(24) NULL,
  bag1Exp DATE NULL,
  bag2Exp DATE NULL,
  timeStart DATETIME NOT NULL,
  timeEnd DATETIME NULL,
  cycles TINYINT NULL,
  systemError NVARCHAR(24) NOT NULL,
  manualDrain TINYINT NULL,
  transferSet TINYINT NULL,
  iDrain INT NULL,
  totalUF INT NULL,
  avgDwell TIME NULL,
  addDwell TIME NULL,
  addDwellInd BIT NULL,
  shortDescription NVARCHAR(255) NOT NULL,
  dateCreated DATETIME NOT NULL,
  dateModified DATETIME NOT NULL,
  createdBy NVARCHAR(60) NOT NULL,
  modifiedBy NVARCHAR(60) NOT NULL
);
GO
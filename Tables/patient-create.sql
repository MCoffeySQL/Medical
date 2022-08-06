USE [Medical]
GO

/****** Object:  Table [dbo].[patient]    Script Date: 7/28/2022 3:22:13 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE IF EXISTS dbo.patient;
GO

CREATE TABLE [dbo].[patient](
	[id] [nvarchar](24) NOT NULL,
	[isActive] [tinyint] NOT NULL,
	[nameLast] [nvarchar](60) NULL,
	[nameMiddle] [nvarchar](60) NULL,
	[nameFirst] [nvarchar](60) NULL,
	[shortDescription] [nvarchar](255) NULL,
	[dateCreated] [datetime] NOT NULL,
	[dateModified] [datetime] NOT NULL,
	[createdBy] [nvarchar](24) NOT NULL,
	[modifiedBy] [nvarchar](24) NOT NULL
);
GO
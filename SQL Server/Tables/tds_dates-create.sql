USE Medical;
GO

DROP TABLE IF EXISTS dbo.tds_dates;
GO

CREATE TABLE dbo.tds_dates(
  id INT IDENTITY(1,1) NOT NULL,
  isActive NVARCHAR(8) NOT NULL,
  dDay INT NULL,
  aDate NVARCHAR(24) NULL,
  aDateStyle101 NVARCHAR(24) NULL,
  aDateStyle112 NVARCHAR(24) NULL,
  aDateMS INT NULL,
  aMonth INT NULL,
  aDay INT NULL,
  aYear INT NULL,
  aDayofWeek INT NULL,
  aDayofYear INT NULL,
  aDayofMonthInstance INT NULL,
  isWeekend NVARCHAR(8) NULL,
  aMonthName NVARCHAR(60) NULL,
  aMonthShortName NVARCHAR(8) NULL,
  aDayName NVARCHAR(24) NULL,
  aDayShortName NVARCHAR(8) NULL,
  aDaySuffix NVARCHAR(8) NULL
);
GO
USE Medical
GO

TRUNCATE TABLE dbo.temp;
GO

INSERT INTO dbo.temp(
  idPatient,
  isActive,
  dateTemp,
  temp,
  tempUnit,
  shortDescription
)
SELECT
  'pat35700',
  1,
  CAST(dateTemp AS DATETIME),
  temp,
  'F',
  '[dialysis_temp]'
FROM source.temp;

SELECT *FROM dbo.temp


SELECT a.[Name], YEAR(a.BirthDate) AS 'BirthYear', 
	[at].AnimalType
FROM Animals AS a
	INNER JOIN AnimalTypes AS [at]
	ON [at].Id = a.AnimalTypeId
WHERE a.OwnerId IS NULL
	AND DATEDIFF(YEAR, a.BirthDate, '2022-01-01') < 5
	AND [at].AnimalType != 'Birds'
ORDER BY a.[Name] ASC;
SELECT CONCAT(o.[Name], '-', a.[Name]) AS 'OwnersAnimals',
	o.PhoneNumber, ac.CageId
FROM Owners AS o
	INNER JOIN Animals AS a
	ON a.OwnerId = o.Id
		INNER JOIN AnimalsCages AS ac
		ON ac.AnimalId = a.Id
		INNER JOIN AnimalTypes AS [at]
		ON [at].Id = a.AnimalTypeId
WHERE [at].AnimalType = 'Mammals'
ORDER BY o.[Name] ASC, a.[Name] DESC;
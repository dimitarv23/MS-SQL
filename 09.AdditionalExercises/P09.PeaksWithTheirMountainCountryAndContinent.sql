SELECT p.PeakName, m.MountainRange, c.CountryName, cont.ContinentName
FROM Peaks AS p
	INNER JOIN Mountains AS m
	ON m.Id = p.MountainId
		INNER JOIN MountainsCountries AS mc
		ON mc.MountainId = m.Id
			INNER JOIN Countries AS c
			ON c.CountryCode = mc.CountryCode
				INNER JOIN Continents AS cont
				ON cont.ContinentCode = c.ContinentCode
ORDER BY p.PeakName ASC, c.CountryName ASC;
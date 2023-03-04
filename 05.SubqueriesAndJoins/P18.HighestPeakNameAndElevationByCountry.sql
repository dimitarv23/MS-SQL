SELECT TOP 5 Country, [Highest Peak Name], [Highest Peak Elevation], Mountain 
	FROM (SELECT * FROM
		(SELECT *, 
			DENSE_RANK() OVER (PARTITION BY Country ORDER BY [Highest Peak Elevation] DESC) AS 'Rank'
		FROM (SELECT c.CountryName AS 'Country', CASE 
					WHEN p.PeakName IS NULL THEN '(no highest peak)'
					ELSE p.PeakName
					END AS 'Highest Peak Name',
				CASE 
					WHEN MAX(p.Elevation) IS NULL THEN 0
					ELSE MAX(p.Elevation)
					END AS 'Highest Peak Elevation', 
				CASE 
					WHEN m.MountainRange IS NULL THEN '(no mountain)' 
					ELSE m.MountainRange
					END AS 'Mountain'
			FROM Countries AS c
				LEFT JOIN MountainsCountries AS mc
				ON mc.CountryCode = c.CountryCode
					LEFT JOIN Mountains AS m
					ON m.Id = mc.MountainId
						LEFT JOIN Peaks AS p
						ON p.MountainId = m.Id
			GROUP BY c.CountryName, p.PeakName, m.MountainRange
			) AS [CountriesWithPeaks]
			) AS [CountriesPeaksRanked]
	WHERE [Rank] = 1
	) AS [FianlTable]
ORDER BY Country ASC;
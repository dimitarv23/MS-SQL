SELECT mc.CountryCode, COUNT(m.MountainRange) AS 'MountainRanges'
FROM MountainsCountries AS mc
	INNER JOIN Mountains AS m
	ON m.Id = mc.MountainId
WHERE mc.CountryCode IN ('US', 'RU', 'BG')
GROUP BY mc.CountryCode;
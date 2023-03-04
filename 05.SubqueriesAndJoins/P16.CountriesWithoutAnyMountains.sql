SELECT COUNT(c.CountryCode) AS 'Count'
FROM Countries AS c
	LEFT OUTER JOIN MountainsCountries AS mc
	ON mc.CountryCode = c.CountryCode
WHERE mc.MountainId IS NULL;
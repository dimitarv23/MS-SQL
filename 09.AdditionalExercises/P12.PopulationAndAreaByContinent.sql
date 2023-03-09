SELECT cont.ContinentName, 
	SUM(c.AreaInSqKm) AS 'CountriesArea',
	SUM(CAST(c.[Population] AS BIGINT)) AS 'CountriesPopulation'
FROM Continents AS cont
	INNER JOIN Countries AS c
	ON c.ContinentCode = cont.ContinentCode
GROUP BY cont.ContinentName
ORDER BY CountriesPopulation DESC;
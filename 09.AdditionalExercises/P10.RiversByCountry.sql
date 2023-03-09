SELECT c.CountryName, cont.ContinentName,
	COUNT(r.Id) AS 'RiversCount', 
	SUM(r.[Length]) AS 'TotalLength'
FROM Countries AS c
	INNER JOIN CountriesRivers AS cr
	ON cr.CountryCode = c.CountryCode
		INNER JOIN Rivers AS r
		ON r.Id = cr.RiverId
	INNER JOIN Continents AS cont
	ON cont.ContinentCode = c.ContinentCode
GROUP BY c.CountryName, cont.ContinentName
ORDER BY RiversCount DESC, TotalLength DESC, 
	c.CountryName ASC;
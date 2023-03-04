SELECT OrderedCurrencies.ContinentCode,
	OrderedCurrencies.CurrencyCode,
	OrderedCurrencies.CurrencyUsage
FROM Continents AS c
	INNER JOIN (
		SELECT coun.ContinentCode AS [ContinentCode],
			COUNT(coun.CurrencyCode) AS [CurrencyUsage],
			coun.CurrencyCode AS [CurrencyCode],
			DENSE_RANK() OVER (PARTITION BY coun.ContinentCode
				ORDER BY COUNT(coun.CurrencyCode) DESC) AS [Rank]
		FROM Countries AS coun
		GROUP BY coun.ContinentCode, coun.CurrencyCode
		HAVING COUNT(coun.CurrencyCode) > 1) AS OrderedCurrencies
	ON c.ContinentCode = OrderedCurrencies.ContinentCode
WHERE OrderedCurrencies.Rank = 1;
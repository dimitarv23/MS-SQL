SELECT c.LastName, CEILING(AVG(b.Rating)) AS 'AverageRating', 
	p.[Name] AS 'PublisherName'
FROM Creators AS c
	INNER JOIN CreatorsBoardgames AS cb
	ON cb.CreatorId = c.Id
		INNER JOIN Boardgames AS b
		ON b.Id = cb.BoardgameId
			INNER JOIN Publishers AS p
			ON p.Id = b.PublisherId
WHERE p.[Name] = 'Stonemaier Games'
GROUP BY c.LastName, p.[Name]
ORDER BY AVG(b.Rating) DESC;
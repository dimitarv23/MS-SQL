SELECT c.Id, CONCAT(c.FirstName, ' ', c.LastName) AS 'CategoryName', c.Email
FROM Creators AS c
WHERE c.Id NOT IN (
	SELECT CreatorId
	FROM CreatorsBoardgames
	)
ORDER BY CategoryName ASC;
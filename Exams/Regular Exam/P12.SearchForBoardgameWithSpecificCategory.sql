CREATE OR ALTER PROC usp_SearchByCategory @Category VARCHAR(50)
AS
BEGIN
	SELECT b.[Name], b.YearPublished, b.Rating, 
		c.[Name] AS 'CategoryName', p.[Name] AS 'PublisherName',
		CONCAT(pr.PlayersMin, ' people') AS 'MinPlayers', 
		CONCAT(pr.PlayersMax, ' people') AS 'MaxPlayers'
	FROM Boardgames AS b
		INNER JOIN Categories AS c
		ON c.Id = b.CategoryId
		INNER JOIN Publishers AS p
		ON p.Id = b.PublisherId
		INNER JOIN PlayersRanges AS pr
		ON pr.Id = b.PlayersRangeId
	WHERE c.[Name] = @Category
	ORDER BY PublisherName ASC, YearPublished DESC;
END;

EXEC usp_SearchByCategory @Category = 'Wargames';
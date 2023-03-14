CREATE OR ALTER FUNCTION udf_CreatorWithBoardgames 
	(@Name NVARCHAR(30))
RETURNS INT
AS
BEGIN
	RETURN (
		SELECT COUNT(cb.BoardgameId)
		FROM Creators AS c
			INNER JOIN CreatorsBoardgames AS cb
			ON cb.CreatorId = c.Id
		WHERE c.FirstName = @Name
	);
END;

SELECT dbo.udf_CreatorWithBoardgames('Bruno');
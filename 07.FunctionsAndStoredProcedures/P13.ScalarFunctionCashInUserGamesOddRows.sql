USE Diablo;

CREATE OR ALTER FUNCTION ufn_CashInUsersGames (@GameName NVARCHAR(30))
RETURNS TABLE
AS
	RETURN (
		SELECT SUM(Cash) AS 'SumCash' FROM (
			SELECT ROW_NUMBER() OVER(ORDER BY Cash DESC) AS 'RowNum', ug.Cash
			FROM UsersGames AS ug
				INNER JOIN Games AS g
				ON g.Id = ug.GameId
			WHERE g.[Name] = @GameName
		) AS [SumCash]
		WHERE RowNum % 2 = 1)
GO
SELECT dbo.ufn_CashInUsersGames('Love in a mist') AS 'SumCash';
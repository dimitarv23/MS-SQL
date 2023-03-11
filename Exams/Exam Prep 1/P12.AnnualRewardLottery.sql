CREATE OR ALTER PROC usp_AnnualRewardLottery @TouristName VARCHAR(50)
AS
BEGIN
	DECLARE @SitesVisited INT;
	DECLARE @Reward VARCHAR(20);

	SET @SitesVisited = (
		SELECT COUNT(*)
		FROM Tourists AS t
			INNER JOIN SitesTourists AS st
			ON st.TouristId = t.Id
		WHERE t.[Name] = @TouristName
	);

	IF (@SitesVisited >= 100)
	BEGIN
		SET @Reward = 'Gold badge';
	END
	ELSE IF (@SitesVisited >= 50)
	BEGIN
		SET @Reward = 'Silver badge';
	END
	ELSE IF (@SitesVisited >= 25)
	BEGIN
		SET @Reward = 'Bronze badge';
	END

	UPDATE Tourists
	SET Reward = @Reward
	WHERE [Name] = @TouristName;

	SELECT [Name], Reward
	FROM Tourists
	WHERE [Name] = @TouristName;
END;

EXEC usp_AnnualRewardLottery @TouristName = 'Gerhild Lutgard';
EXEC usp_AnnualRewardLottery @TouristName = 'Teodor Petrov';
EXEC usp_AnnualRewardLottery @TouristName = 'Zac Walsh';
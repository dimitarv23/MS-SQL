CREATE OR ALTER PROC usp_AnimalsWithOwnersOrNot 
	@AnimalName VARCHAR(30)
AS
BEGIN
	SELECT a.[Name], CASE
		WHEN a.OwnerId IS NULL THEN 'For adoption'
		ELSE o.[Name]
		END AS 'OwnersName'
	FROM Animals AS a
		LEFT OUTER JOIN Owners AS o
		ON o.Id = a.OwnerId
	WHERE a.[Name] = @AnimalName;
END;
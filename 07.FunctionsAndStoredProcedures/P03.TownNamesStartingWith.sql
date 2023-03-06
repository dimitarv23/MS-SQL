CREATE OR ALTER PROC usp_GetTownsStartingWith @Start NVARCHAR(10)
AS
BEGIN
	SELECT [Name]
	FROM Towns
	WHERE [Name] LIKE CONCAT(@Start, '%');
END
GO
EXEC usp_GetTownsStartingWith 'b';
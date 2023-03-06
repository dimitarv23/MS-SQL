CREATE OR ALTER FUNCTION ufn_IsWordComprised(@SetOfLetters NVARCHAR(30), @Word NVARCHAR(30))
RETURNS BIT
BEGIN
	DECLARE @Index INT = 1;

	WHILE @Index <= LEN(@Word)
	BEGIN
		DECLARE @CurrentLetter NCHAR(1) = SUBSTRING(@Word, @Index, 1)
		IF (CHARINDEX(@CurrentLetter, @SetOfLetters) = 0)
		BEGIN
			RETURN 0;
		END

		SET @Index = @Index + 1;
	END

	RETURN 1;
END

SELECT 'oistmiahf' AS [SetOfLetters], 'Sofia' AS [Word], 
	dbo.ufn_IsWordComprised('oistmiahf', 'Sofia') AS [Result];
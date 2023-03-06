CREATE OR ALTER FUNCTION ufn_CalculateFutureValue (
	@Sum DECIMAL(15, 4), @YearlyInterestRate FLOAT, @NumberOfYears INT)
RETURNS DECIMAL(15, 4)
BEGIN
	RETURN @Sum * POWER(1 + @YearlyInterestRate, @NumberOfYears);
END
GO
SELECT dbo.ufn_CalculateFutureValue(1000, 0.1, 5) AS 'Future Value';
CREATE OR ALTER PROC usp_DepositMoney @AccountId INT, @MoneyAmount MONEY
AS
BEGIN
	IF (@MoneyAmount > 0)
	BEGIN
		UPDATE Accounts
		SET Balance = Balance + @MoneyAmount
		WHERE Id = @AccountId;
	END
END
GO
EXEC usp_DepositMoney @AccountId = 1, @MoneyAmount = 10;
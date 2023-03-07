CREATE OR ALTER PROC usp_WithdrawMoney @AccountId INT, @MoneyAmount MONEY
AS
BEGIN
	IF (@MoneyAmount > 0)
	BEGIN
		UPDATE Accounts
		SET Balance = Balance - @MoneyAmount
		WHERE Id = @AccountId;
	END
END
GO
EXEC usp_WithdrawMoney @AccountId = 5, @MoneyAmount = 25;
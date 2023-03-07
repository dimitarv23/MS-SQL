CREATE PROC usp_TransferMoney @SenderId INT, @ReceiverId INT, @Amount MONEY
AS
BEGIN
	BEGIN TRAN

	IF (@Amount <= 0)
	BEGIN
		ROLLBACK TRAN
	END

	EXEC usp_WithdrawMoney @AccountId = @SenderId, @MoneyAmount = @Amount;
	EXEC usp_DepositMoney @AccountId = @ReceiverId, @MoneyAmount = @Amount;

	COMMIT TRAN
END
GO
EXEC usp_TransferMoney @SenderId = 5, @ReceiverId = 1, @Amount = 5000;
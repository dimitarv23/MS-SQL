CREATE OR ALTER PROC usp_CalculateFutureValueForAccount @AccountId INT, @InterestRate FLOAT
AS
BEGIN
	SELECT ac.Id AS 'Account Id', h.FirstName AS 'First Name',
		h.LastName AS 'Last Name', ac.Balance AS 'Current Balance',
		dbo.ufn_CalculateFutureValue(ac.Balance, @InterestRate, 5) AS 'Balance in 5 years'
	FROM AccountHolders AS h
		INNER JOIN Accounts AS ac
		ON ac.AccountHolderId = h.Id
	WHERE ac.Id = @AccountId
END
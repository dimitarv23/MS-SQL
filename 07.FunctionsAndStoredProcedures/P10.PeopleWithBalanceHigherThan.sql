CREATE OR ALTER PROC usp_GetHoldersWithBalanceHigherThan @Amount MONEY
AS
BEGIN
	SELECT h.FirstName AS 'First Name', h.LastName AS 'Last Name'
	FROM AccountHolders AS h
	WHERE (
		SELECT SUM(ac.Balance)
		FROM Accounts AS ac
		WHERE ac.AccountHolderId = h.Id
		) > @Amount
	ORDER BY h.FirstName ASC, h.LastName ASC
END
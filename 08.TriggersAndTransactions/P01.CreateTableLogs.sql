USE Bank;

CREATE TABLE Logs (
	LogId INT PRIMARY KEY IDENTITY,
	AccountId INT NOT NULL,
	OldSum MONEY NOT NULL,
	NewSum MONEY NOT NULL,
	CONSTRAINT FK_Logs_Accounts
		FOREIGN KEY (AccountId)
		REFERENCES Accounts(Id),
);

CREATE TRIGGER dbo.TR_Accounts_AddLogs
ON Accounts
AFTER UPDATE
AS
INSERT INTO Logs (AccountId, OldSum, NewSum)
	SELECT i.Id, d.Balance, i.Balance
	FROM Inserted AS i
		INNER JOIN Deleted AS d
		ON d.Id = i.Id;
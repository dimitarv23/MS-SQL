CREATE TABLE NotificationEmails (
	Id INT PRIMARY KEY IDENTITY,
	Recipient INT NOT NULL,
	[Subject] NVARCHAR(255),
	Body NVARCHAR(MAX),
	CONSTRAINT FK_NotificationEmails_Accounts
		FOREIGN KEY (Recipient)
		REFERENCES Accounts(Id)
);

CREATE TRIGGER dbo.TR_Logs_CreateEmail
ON Logs
AFTER INSERT
AS
INSERT INTO NotificationEmails (Recipient, [Subject], Body)
	SELECT i.AccountId, CONCAT('Balance change for account: ', i.AccountId),
		CONCAT('On ', FORMAT(GETDATE(), 'MMM dd yyyy h:mmtt'), 
			' your balance was changed from ', i.OldSum, ' to ', i.NewSum)
	FROM Inserted AS i;
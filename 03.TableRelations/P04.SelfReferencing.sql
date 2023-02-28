CREATE TABLE Teachers (
	TeacherID int PRIMARY KEY IDENTITY(101, 1),
	[Name] nvarchar(30) NOT NULL,
	ManagerID int,
	CONSTRAINT FK_Teacher_Manager
		FOREIGN KEY(ManagerID)
		REFERENCES Teachers(TeacherID)
);

INSERT INTO Teachers ([Name], ManagerID)
VALUES	('John', NULL)
		,('Maya', 106)
		,('Silvia', 106)
		,('Ted', 105)
		,('Mark', 101)
		,('Greta', 101);
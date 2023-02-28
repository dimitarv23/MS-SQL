CREATE TABLE Students (
	StudentID int PRIMARY KEY IDENTITY(1, 1),
	[Name] nvarchar(40) NOT NULL
);

CREATE TABLE Exams (
	ExamID int PRIMARY KEY IDENTITY(101, 1),
	[Name] nvarchar(30) NOT NULL
);

CREATE TABLE StudentsExams (
	StudentID int NOT NULL,
	ExamID int NOT NULL,
	CONSTRAINT FK_StudentsExams_Students
		FOREIGN KEY(StudentID)
		REFERENCES Students(StudentID),
	CONSTRAINT FK_StudentsExams_Exams
		FOREIGN KEY(ExamID)
		REFERENCES Exams(ExamID),
	CONSTRAINT PK_StudentsExams
		PRIMARY KEY(StudentID, ExamId)
);

INSERT INTO Students ([Name])
VALUES	('Mila')
		,('Toni')
		,('Ron');

INSERT INTO Exams ([Name])
VALUES	('SpringMVC')
		,('Neo4j')
		,('Oracle 11g');

INSERT INTO StudentsExams (StudentID, ExamID)
VALUES	(1, 101)
		,(1, 102)
		,(2, 101)
		,(3, 103)
		,(2, 102)
		,(2, 103);
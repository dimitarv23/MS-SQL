CREATE DATABASE University;
USE University;

CREATE TABLE Majors (
	MajorID int PRIMARY KEY IDENTITY,
	[Name] nvarchar(30) NOT NULL
);

CREATE TABLE Students (
	StudentID int PRIMARY KEY IDENTITY,
	StudentNumber nvarchar(20) NOT NULL,
	StudentName nvarchar(40) NOT NULL,
	MajorID int NOT NULL,
	CONSTRAINT FK_Students_Majors
		FOREIGN KEY(MajorID)
		REFERENCES Majors(MajorID)
);

CREATE TABLE Payments (
	PaymentID int PRIMARY KEY IDENTITY,
	PaymentDate date,
	PaymentAmount money NOT NULL,
	StudentID int NOT NULL,
	CONSTRAINT FK_Payments_Students
		FOREIGN KEY(StudentID)
		REFERENCES Students(StudentID)
);

CREATE TABLE Subjects (
	SubjectID int PRIMARY KEY IDENTITY,
	SubjectName nvarchar(30) NOT NULL
);

CREATE TABLE Agenda (
	StudentID int NOT NULL,
	SubjectID int NOT NULL,
	CONSTRAINT FK_Agenda_Students
		FOREIGN KEY(StudentID)
		REFERENCES Students(StudentID),
	CONSTRAINT FK_Agenda_Subjects
		FOREIGN KEY(SubjectID)
		REFERENCES Subjects(SubjectID),
	CONSTRAINT PK_Agenda
		PRIMARY KEY(StudentID, SubjectID)
);
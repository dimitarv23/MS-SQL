CREATE TABLE People
(
	Id int PRIMARY KEY IDENTITY(1, 1),
	[Name] nvarchar(200) NOT NULL,
	Picture IMAGE,
	Height float,
	[Weight] float,
	Gender char(1) NOT NULL,
	Birthdate datetime2 NOT NULL,
	Biography nvarchar(max)
);

INSERT INTO People ([Name], Height, [Weight], Gender, Birthdate, Biography)
VALUES	('Ivan', 1.72, 69, 'm', '2006-12-20', 'Biography 1'),
		('Pesho', 1.93, 99.9, 'm', '2001-04-14', 'Biography 2'),
		('Petrana', 1.76, 56, 'f', '2005-01-31', 'Biography 3'),
		('Gosho', 1.84, 81, 'm', '2003-08-29', 'Biography 4'),
		('Gergana', 1.69, 49, 'f', '2007-02-02', 'Biography 5');
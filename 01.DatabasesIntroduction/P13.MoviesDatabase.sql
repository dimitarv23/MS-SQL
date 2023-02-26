CREATE DATABASE Movies;
USE Movies;

CREATE TABLE Directors
(
	Id int PRIMARY KEY IDENTITY(1, 1),
	DirectorName nvarchar(30) NOT NULL,
	Notes nvarchar(max)
);

CREATE TABLE Genres
(
	Id int PRIMARY KEY IDENTITY(1, 1),
	GenreName nvarchar(30) NOT NULL,
	Notes nvarchar(max)
);

CREATE TABLE Categories
(
	Id int PRIMARY KEY IDENTITY(1, 1),
	CategoryName nvarchar(30) NOT NULL,
	Notes nvarchar(max)
);

CREATE TABLE Movies
(
	Id int PRIMARY KEY IDENTITY(1, 1),
	Title nvarchar(30) NOT NULL,
	DirectorId int NOT NULL,
	CopyrightYear date,
	[Length] int,
	GenreId int NOT NULL,
	CategoryId int NOT NULL,
	Rating float,
	Notes nvarchar(max)
);

INSERT INTO Directors (DirectorName, Notes)
VALUES	('Martin Scorsese', 'Sample notes 1'),
		('Steven Spielberg', NULL),
		('Alfred Hitchcock', 'Sample notes 2'),
		('Quentin Tarantino', 'Sample notes 3'),
		('Stanley Kubrick', NULL);

INSERT INTO Genres (GenreName, Notes)
VALUES	('Action', 'Sample notes 1'),
		('Horror', NULL),
		('Drama', 'Sample notes 2'),
		('Thriller', 'Sample notes 3'),
		('Comedy', NULL);

INSERT INTO Categories (CategoryName, Notes)
VALUES	('CategoryName1', 'Sample notes 1'),
		('CategoryName2', NULL),
		('CategoryName3', 'Sample notes 2'),
		('CategoryName4', 'Sample notes 3'),
		('CategoryName5', NULL);

INSERT INTO Movies (Title, DirectorId, CopyrightYear, [Length], GenreId, CategoryId, Rating, Notes)
VALUES	('MovieTitle1', 1, '2022-10-20', 126, 2, 4, 4.5, 'Sample notes 1'),
		('MovieTitle2', 4, '2020-01-12', 98, 5, 3, 3.8, 'Sample notes 2'),
		('MovieTitle3', 2, '2022-06-30', 142, 1, 1, 5, 'Sample notes 3'),
		('MovieTitle4', 5, '2022-04-07', 109, 4, 5, 4.9, 'Sample notes 4'),
		('MovieTitle5', 3, '2022-12-02', 122, 3, 2, 2.5, 'Sample notes 5');
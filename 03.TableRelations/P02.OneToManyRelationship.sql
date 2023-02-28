CREATE TABLE Manufacturers (
	ManufacturerID int PRIMARY KEY IDENTITY(1, 1),
	[Name] nvarchar(20) NOT NULL,
	EstablishedOn datetime2
);

CREATE TABLE Models (
	ModelID int PRIMARY KEY IDENTITY(101, 1),
	[Name] nvarchar(20) NOT NULL,
	ManufacturerID int NOT NULL,
	CONSTRAINT FK_Models_Manufacturers
		FOREIGN KEY(ManufacturerID)
		REFERENCES Manufacturers(ManufacturerID)
);

INSERT INTO Manufacturers ([Name], EstablishedOn)
VALUES	('BMW', '1916/03/07')
		,('Tesla', '2003/01/01')
		,('Lada', '1966/05/01');

INSERT INTO Models ([Name], ManufacturerID)
VALUES	('X1', 1)
		,('i6', 1)
		,('Model S', 2)
		,('Model X', 2)
		,('Model 3', 2)
		,('Nova', 3);
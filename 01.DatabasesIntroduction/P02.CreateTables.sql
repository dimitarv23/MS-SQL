CREATE TABLE Minions
(
	Id int,
	[Name] nvarchar(30),
	Age int,
	CONSTRAINT PK_Minions PRIMARY KEY(Id)
);

CREATE TABLE Towns
(
	Id int,
	[Name] nvarchar(30),
	CONSTRAINT PK_Towns PRIMARY KEY(Id)
);
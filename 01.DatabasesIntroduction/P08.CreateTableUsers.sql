CREATE TABLE Users
(
	Id int PRIMARY KEY IDENTITY(1, 1),
	Username varchar(30) NOT NULL,
	[Password] varchar(26) NOT NULL,
	ProfilePicture IMAGE,
	LastLoginTime datetime2,
	IsDeleted bit
);

INSERT INTO Users (Username, [Password], LastLoginTime, IsDeleted)
VALUES	('ivan4o', 'ivan4oPassword', '2022-12-20', 0),
		('pe6o', 'pe6oPassword', '2022-12-16', 0),
		('petranka', 'petrankaPassword', '2022-12-17', 1),
		('dimitri4ko', 'dimitri4koPassword', '2022-12-02', 0),
		('gergana', 'gerganaPassword', '2022-12-21', 0);
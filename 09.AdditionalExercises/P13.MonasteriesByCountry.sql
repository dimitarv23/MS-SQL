CREATE TABLE Monasteries (
	Id INT PRIMARY KEY IDENTITY,
	[Name] nvarchar(50) NOT NULL,
	CountryCode CHAR(2) NOT NULL,
	CONSTRAINT FK_Monasteries_Countries
		FOREIGN KEY(CountryCode)
		REFERENCES Countries(CountryCode)
);

INSERT INTO Monasteries	([Name], CountryCode) 
VALUES	('Rila Monastery “St. Ivan of Rila”', 'BG'), 
		('Bachkovo Monastery “Virgin Mary”', 'BG'),
		('Troyan Monastery “Holy Mother''s Assumption”', 'BG'),
		('Kopan Monastery', 'NP'),
		('Thrangu Tashi Yangtse Monastery', 'NP'),
		('Shechen Tennyi Dargyeling Monastery', 'NP'),
		('Benchen Monastery', 'NP'),
		('Southern Shaolin Monastery', 'CN'),
		('Dabei Monastery', 'CN'),
		('Wa Sau Toi', 'CN'),
		('Lhunshigyia Monastery', 'CN'),
		('Rakya Monastery', 'CN'),
		('Monasteries of Meteora', 'GR'),
		('The Holy Monastery of Stavronikita', 'GR'),
		('Taung Kalat Monastery', 'MM'),
		('Pa-Auk Forest Monastery', 'MM'),
		('Taktsang Palphug Monastery', 'BT'),
		('Sümela Monastery', 'TR');

ALTER TABLE Countries
ADD IsDeleted BIT;

ALTER TABLE Countries
ADD CONSTRAINT df_IsDeleted
DEFAULT 0 FOR IsDeleted;

UPDATE Countries
SET IsDeleted = 1
WHERE 3 < (
	SELECT COUNT(RiverId)
	FROM CountriesRivers AS cr
	WHERE cr.CountryCode = Countries.CountryCode
	GROUP BY cr.CountryCode);

SELECT m.[Name], c.CountryName AS 'Country'
FROM Monasteries AS m
	INNER JOIN Countries AS c
	ON c.CountryCode = m.CountryCode
WHERE c.IsDeleted IS NULL
ORDER BY m.[Name] ASC;
SELECT s.[Name] AS 'Site',
	l.[Name] AS 'Location',
	s.Establishment,
	c.[Name] AS 'Category'
FROM Sites AS s
	INNER JOIN Locations AS l
	ON l.Id = s.LocationId
	INNER JOIN Categories AS c
	ON c.Id = s.CategoryId
ORDER BY Category DESC,
	[Location] ASC, [Site] ASC;
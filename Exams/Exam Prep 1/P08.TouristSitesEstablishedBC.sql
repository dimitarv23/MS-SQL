SELECT s.[Name] AS 'Site', l.[Name] AS 'Location',
	l.Municipality, l.Province, s.Establishment
FROM Sites AS s
	INNER JOIN Locations AS l
	ON l.Id = s.LocationId
WHERE l.[Name] NOT LIKE '[BMDbmd]%'
	AND s.Establishment LIKE '%BC'
ORDER BY [Site] ASC;
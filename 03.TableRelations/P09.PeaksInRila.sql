USE [Geography];

--Solution 1
SELECT (SELECT m.MountainRange
		FROM Mountains m
		WHERE p.MountainId = m.Id) AS 'MountainRange', 
		p.PeakName, p.Elevation
FROM Peaks p
WHERE p.MountainID IN (
	SELECT Id FROM Mountains m
	WHERE m.MountainRange = 'Rila')
ORDER BY p.Elevation DESC;

--Solution 2 (Easier)
SELECT m.MountainRange, p.PeakName, p.Elevation
FROM Mountains m
JOIN Peaks p on MountainId = m.Id
WHERE m.MountainRange = 'Rila'
ORDER BY p.Elevation DESC;
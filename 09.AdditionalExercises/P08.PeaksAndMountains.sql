USE [Geography];

SELECT p.PeakName, m.MountainRange, p.Elevation
FROM Peaks AS p
	INNER JOIN Mountains AS m
	ON m.Id = p.MountainId
ORDER BY p.Elevation DESC, p.PeakName ASC;
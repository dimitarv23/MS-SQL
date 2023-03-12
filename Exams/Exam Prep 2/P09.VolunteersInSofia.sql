SELECT v.[Name], v.PhoneNumber, 
	TRIM(SUBSTRING(TRIM(v.[Address]), 8, LEN(v.[Address])))
		AS 'Address'
FROM Volunteers AS v
	INNER JOIN VolunteersDepartments AS vd
	ON vd.Id = v.DepartmentId
WHERE vd.DepartmentName = 'Education program assistant'
	AND SUBSTRING(TRIM(v.[Address]), 1, 5) = 'Sofia'
ORDER BY v.[Name] ASC;
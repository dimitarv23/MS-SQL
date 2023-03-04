SELECT TOP 50 e.EmployeeID, CONCAT(e.FirstName, ' ', e.LastName) AS 'EmployeeName',
	CONCAT(em.FirstName, ' ', em.LastName) AS 'ManagerName', d.[Name] AS 'DepartmentName'
FROM Employees AS e
	INNER JOIN Employees AS em
	ON em.EmployeeID = e.ManagerID
		INNER JOIN Departments AS d
		ON d.DepartmentID = e.DepartmentID
ORDER BY EmployeeID ASC;
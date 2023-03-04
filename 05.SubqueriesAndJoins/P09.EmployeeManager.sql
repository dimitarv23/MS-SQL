SELECT e.EmployeeID, e.FirstName, e.ManagerID, em.FirstName AS 'ManagerName'
FROM Employees AS e
	INNER JOIN Employees AS em
	ON em.EmployeeID = e.ManagerID
WHERE e.ManagerID IN (3, 7)
ORDER BY e.EmployeeID ASC;
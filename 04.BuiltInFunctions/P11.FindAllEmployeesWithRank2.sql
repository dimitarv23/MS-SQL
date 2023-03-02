SELECT * 
FROM (SELECT e.EmployeeID, e.FirstName, e.LastName, e.Salary, 
	DENSE_RANK() OVER(PARTITION BY e.Salary ORDER BY e.EmployeeID ASC) AS 'Rank'
	FROM Employees AS e) AS a
WHERE a.Salary BETWEEN 10000 AND 50000
	AND a.[Rank] = 2
ORDER BY a.Salary DESC;
SELECT DISTINCT DepartmentID, Salary
FROM (
	SELECT DepartmentID, Salary,
		DENSE_RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS 'Rank'
	FROM Employees
	) AS [RankedSalaries]
WHERE [Rank] = 3;
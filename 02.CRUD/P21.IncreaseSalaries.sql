UPDATE Employees
SET Salary = 1.12 * Salary
WHERE DepartmentID IN (
	SELECT d.DepartmentID
	FROM Departments d
	WHERE d.[Name] IN ('Engineering', 'Tool Design', 'Marketing', 'Information Services'));

SELECT Salary
FROM Employees;

UPDATE Employees
SET Salary = Salary / 1.12
WHERE DepartmentID IN (
	SELECT d.DepartmentID
	FROM Departments d
	WHERE d.[Name] IN ('Engineering', 'Tool Design', 'Marketing', 'Information Services'));
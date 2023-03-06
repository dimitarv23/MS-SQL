CREATE OR ALTER PROC usp_DeleteEmployeesFromDepartment @DepartmentId INT
AS
BEGIN
	DECLARE @empIDsToBeDeleted TABLE (
	Id int
	);

	INSERT INTO @empIDsToBeDeleted
	SELECT e.EmployeeID
	FROM Employees AS e
	WHERE e.DepartmentID = @departmentId;

	ALTER TABLE Departments
	ALTER COLUMN ManagerID int NULL;

	DELETE FROM EmployeesProjects
	WHERE EmployeeID IN (
		SELECT Id FROM @empIDsToBeDeleted);

	UPDATE Employees
	SET ManagerID = NULL
	WHERE ManagerID IN (
		SELECT Id FROM @empIDsToBeDeleted);

	UPDATE Departments
	SET ManagerID = NULL
	WHERE ManagerID IN (
		SELECT Id FROM @empIDsToBeDeleted);

	DELETE FROM Employees
	WHERE EmployeeID IN (
		SELECT Id FROM @empIDsToBeDeleted);

	DELETE FROM Departments
	WHERE DepartmentID = @departmentId;

	SELECT COUNT(e.EmployeeID) AS 'Employees Count'
	FROM Employees AS e
	WHERE e.DepartmentID = @DepartmentId;
END
GO
EXEC usp_DeleteEmployeesFromDepartment 1;
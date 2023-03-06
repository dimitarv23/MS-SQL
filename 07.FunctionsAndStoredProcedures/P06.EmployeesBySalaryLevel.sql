CREATE OR ALTER PROC usp_EmployeesBySalaryLevel @SalaryLevel NVARCHAR(10)
AS
BEGIN
	SELECT e.FirstName, e.LastName
	FROM Employees AS e
	WHERE dbo.ufn_GetSalaryLevel(e.Salary) = @SalaryLevel
END
GO
EXEC usp_EmployeesBySalaryLevel 'High';
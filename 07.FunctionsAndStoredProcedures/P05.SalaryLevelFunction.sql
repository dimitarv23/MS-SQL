CREATE FUNCTION ufn_GetSalaryLevel (@Salary DECIMAL(18,4))
RETURNS NVARCHAR(10)
BEGIN
	DECLARE @SalaryLevel NVARCHAR(10);
	
	IF (@Salary < 30000)
	BEGIN
		SET @SalaryLevel = 'Low';
	END
	ELSE IF (@Salary <= 50000)
	BEGIN
		SET @SalaryLevel = 'Average'
	END
	ELSE
		SET @SalaryLevel = 'High'

	RETURN @SalaryLevel;
END

SELECT FirstName, LastName, Salary, 
	dbo.ufn_GetSalaryLevel(Salary) AS 'Salary Level'
FROM Employees;
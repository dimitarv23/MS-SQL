USE SoftUni;

CREATE PROC usp_AssignProject @EmployeeId INT, @ProjectID INT
AS
BEGIN
	BEGIN TRANSACTION;
	
	DECLARE @EmployeeProjects INT = (
		SELECT COUNT(ProjectID)
		FROM EmployeesProjects
		WHERE EmployeeID = @EmployeeId);

	IF (@EmployeeProjects >= 3)
	BEGIN
		ROLLBACK;
		THROW 51000, 'The employee has too many projects!', 1;
	END

	INSERT INTO EmployeesProjects
	VALUES	(@EmployeeId, @ProjectID);
	COMMIT;
END
GO
EXEC usp_AssignProject @EmployeeId = 1, @ProjectId = 1;
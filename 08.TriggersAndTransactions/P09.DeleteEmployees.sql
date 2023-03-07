CREATE TABLE Deleted_Employees (
	EmployeeId INT PRIMARY KEY,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	MiddleName VARCHAR(50),
	JobTitle VARCHAR(50) NOT NULL,
	DepartmentId INT NOT NULL,
	Salary MONEY NOT NULL,
	CONSTRAINT FK_DeletedEmployees_Departments
		FOREIGN KEY (DepartmentId)
		REFERENCES Departments(DepartmentID)
);

CREATE TRIGGER TR_Employees_StoreFiredEmployees
ON Employees
AFTER DELETE
AS
BEGIN
	INSERT INTO Deleted_Employees (FirstName, LastName, MiddleName, 
									JobTitle, DepartmentId, Salary)
		SELECT d.FirstName, d.LastName, d.MiddleName, 
			d.JobTitle, d.DepartmentID, d.Salary
		FROM Deleted AS d
END;
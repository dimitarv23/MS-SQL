CREATE OR ALTER FUNCTION udf_GetVolunteersCountFromADepartment
	(@VolunteersDepartment VARCHAR(30))
RETURNS INT
AS
BEGIN
	RETURN (
		SELECT COUNT(v.Id)
		FROM Volunteers AS v
			INNER JOIN VolunteersDepartments AS vd
			ON vd.Id = v.DepartmentId
		WHERE vd.DepartmentName = @VolunteersDepartment
		);
END;
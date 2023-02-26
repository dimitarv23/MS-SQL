CREATE DATABASE SoftUni;
USE SoftUni;

CREATE TABLE Towns
(
	Id int PRIMARY KEY IDENTITY(1, 1),
	[Name] nvarchar(30) NOT NULL
);

CREATE TABLE Addresses
(
	Id int PRIMARY KEY IDENTITY(1, 1),
	AddressText nvarchar(30) NOT NULL,
	TownId int NOT NULL,
	CONSTRAINT FK_Addresses_Towns FOREIGN KEY(TownId) REFERENCES Towns(Id)
);

CREATE TABLE Departments
(
	Id int PRIMARY KEY IDENTITY(1, 1),
	[Name] nvarchar(30) NOT NULL
);

CREATE TABLE Employees
(
	Id int PRIMARY KEY IDENTITY(1, 1),
	FirstName nvarchar(30) NOT NULL,
	MiddleName nvarchar(20),
	LastName nvarchar(20) NOT NULL,
	JobTitle nvarchar(30),
	DepartmentId int NOT NULL,
	HireDate date,
	Salary money NOT NULL,
	AddressId int,
	CONSTRAINT FK_Employees_Departments FOREIGN KEY(DepartmentId) REFERENCES Departments(Id),
	CONSTRAINT FK_Employees_Addresses FOREIGN KEY(AddressId) REFERENCES Addresses(Id)
);
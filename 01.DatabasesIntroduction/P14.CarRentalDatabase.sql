CREATE DATABASE CarRental;
USE CarRental;

CREATE TABLE Categories
(
	Id int PRIMARY KEY IDENTITY(1, 1),
	CategoryName nvarchar(30) NOT NULL,
	DailyRate float,
	WeeklyRate float,
	MonthlyRate float,
	WeekendRate float
);

CREATE TABLE Cars
(
	Id int PRIMARY KEY IDENTITY(1, 1),
	PlateNumber nvarchar(10) NOT NULL,
	Manufacturer nvarchar(20) NOT NULL,
	Model nvarchar(20) NOT NULL,
	CarYear int NOT NULL,
	CategoryId int NOT NULL,
	Doors int,
	Picture IMAGE,
	Condition nvarchar(30),
	Available BIT NOT NULL
);

CREATE TABLE Employees
(
	Id int PRIMARY KEY IDENTITY(1, 1),
	FirstName nvarchar(30) NOT NULL,
	LastName nvarchar(20) NOT NULL,
	Title nvarchar(20),
	Notes nvarchar(max)
);

CREATE TABLE Customers
(
	Id int PRIMARY KEY IDENTITY(1, 1),
	DriverLicenceNumber nvarchar(20) NOT NULL,
	FullName nvarchar(50) NOT NULL,
	[Address] nvarchar(30),
	City nvarchar(20),
	ZIPCode nvarchar(20),
	Notes nvarchar(max)
);

CREATE TABLE RentalOrders
(
	Id int PRIMARY KEY IDENTITY(1, 1),
	EmployeeId int NOT NULL,
	CustomerId int NOT NULL,
	CarId int NOT NULL,
	TankLevel float,
	KilometerageStart float,
	KilometrageEnd float,
	TotalKilometrage float NOT NULL,
	StartDate date NOT NULL,
	EndDate date NOT NULL,
	TotalDays int,
	RateApplied float,
	TaxRate float,
	OrderStatus nvarchar(20),
	Notes nvarchar(max)
);

INSERT INTO Categories (CategoryName, DailyRate, WeeklyRate, MonthlyRate, WeekendRate)
VALUES	('CategoryName1', 4.5, 3.9, 4, 4.5),
		('CategoryName2', 4.2, 3.5, 5, 4.2),
		('CategoryName3', 4.6, 3.4, 3.7, 4);

INSERT INTO Cars (PlateNumber, Manufacturer, Model, CarYear, CategoryId, Doors, Available)
VALUES	('A7777BC', 'BMW', 'E60', 2009, 2, 5, 1),
		('CB6666BC', 'BMW', 'E92', 2007, 1, 3, 0),
		('PB3333BC', 'BMW', 'F30', 2013, 3, 5, 1);

INSERT INTO Employees (FirstName, LastName, Title, Notes)
VALUES	('Ivan', 'Ivanov', 'Boss', 'Notes 1'),
		('Georgi', 'Georgiev', 'Call Centre', 'Notes 2'),
		('Pesho', 'Petrov', 'Marketing Manager', 'Notes 3');

INSERT INTO Customers (DriverLicenceNumber, FullName, [Address], City, ZIPCode, Notes)
VALUES	('A7777BC', 'Ivan Ivanov', NULL, 'Blagoevgrad', NULL, 'Notes 1'),
		('CB6666BC', 'Georgi Georgiev', NULL, 'Sofia', NULL, 'Notes 2'),
		('PB3333BC', 'Pesho Petrov', NULL, 'Plovdiv', NULL, 'Notes 3');

INSERT INTO RentalOrders (EmployeeId, CustomerId, CarId, TankLevel, TotalKilometrage, StartDate, EndDate, Notes)
VALUES	(2, 1, 3, 45.5, 206.9, '2022-12-12', '2022-12-17', 'Notes 1'),
		(1, 3, 1, 25.8, 100, '2022-12-19', '2022-12-21', 'Notes 2'),
		(3, 2, 2, 67, 149.1, '2022-12-15', '2022-12-19', 'Notes 2');
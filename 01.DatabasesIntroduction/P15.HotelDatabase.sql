CREATE DATABASE Hotel;
USE Hotel;

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
	AccountNumber int PRIMARY KEY IDENTITY(1, 1),
	FirstName nvarchar(30) NOT NULL,
	LastName nvarchar(20) NOT NULL,
	PhoneNumber nvarchar(15),
	EmergencyName nvarchar(20),
	EmergencyNumber int,
	Notes nvarchar(max)
);

CREATE TABLE RoomStatus
(
	RoomStatus nvarchar(20) PRIMARY KEY,
	Notes nvarchar(max)
);

CREATE TABLE RoomTypes
(
	RoomType nvarchar(20) PRIMARY KEY,
	Notes nvarchar(max)
);

CREATE TABLE BedTypes
(
	BedType nvarchar(20) PRIMARY KEY,
	Notes nvarchar(max)
);

CREATE TABLE Rooms
(
	RoomNumber int PRIMARY KEY IDENTITY(1, 1),
	RoomType nvarchar(20) NOT NULL,
	BedType nvarchar(20) NOT NULL,
	Rate float,
	RoomStatus nvarchar(20) NOT NULL,
	Notes nvarchar(max)
);

CREATE TABLE Payments
(
	Id int PRIMARY KEY IDENTITY(1, 1),
	EmployeeId int NOT NULL,
	PaymentDate date,
	AccountNumber int NOT NULL,
	FirstDateOccupied date NOT NULL,
	LastDateOccupied date NOT NULL,
	TotalDays int,
	AmountCharged money,
	TaxRate float,
	TaxAmount float,
	PaymentTotal money NOT NULL,
	Notes nvarchar(max)
);

CREATE TABLE Occupancies
(
	Id int PRIMARY KEY IDENTITY(1, 1),
	EmployeeId int NOT NULL,
	DateOccupied date,
	AccountNumber int NOT NULL,
	RoomNumber int NOT NULL,
	RateApplied float,
	PhoneCharge nvarchar(20),
	Notes nvarchar(max)
);

INSERT INTO Employees (FirstName, LastName)
VALUES	('Ivan', 'Ivanov'),
		('Georgi', 'Georgiev'),
		('Pesho', 'Petrov');

INSERT INTO Customers (FirstName, LastName)
VALUES	('Ivan', 'Ivanov'),
		('Georgi', 'Georgiev'),
		('Pesho', 'Petrov');

INSERT INTO RoomStatus (RoomStatus)
VALUES	('Room Status 1'),
		('Room Status 2'),
		('Room Status 3');

INSERT INTO RoomTypes (RoomType)
VALUES	('Room Type 1'),
		('Room Type 2'),
		('Room Type 3');

INSERT INTO BedTypes (BedType)
VALUES	('Bed Type 1'),
		('Bed Type 2'),
		('Bed Type 3');

INSERT INTO Rooms (RoomType, BedType, RoomStatus)
VALUES	('Room Type 1', 'Bed Type 1', 'Room Status 1'),
		('Room Type 2', 'Bed Type 2', 'Room Status 2'),
		('Room Type 3', 'Bed Type 3', 'Room Status 3');

INSERT INTO Payments (EmployeeId, AccountNumber, FirstDateOccupied, LastDateOccupied, PaymentTotal)
VALUES	(1, 2, '2022-12-12', '2022-12-22', 1299.99),
		(2, 1, '2022-12-17', '2022-12-21', 689.99),
		(3, 3, '2022-12-30', '2023-01-02', 1499.49);

INSERT INTO Occupancies (EmployeeId, AccountNumber, RoomNumber)
VALUES	(1, 1, 1),
		(2, 2, 2),
		(3, 3, 3);
CREATE DATABASE OnlineStore;
USE OnlineStore;

CREATE TABLE Cities (
	CityID int PRIMARY KEY IDENTITY,
	[Name] varchar(50) NOT NULL
);

CREATE TABLE Customers (
	CustomerID int PRIMARY KEY IDENTITY,
	[Name] varchar(50) NOT NULL,
	Birthday date,
	CityID int NOT NULL,
	CONSTRAINT FK_Customers_Cities
		FOREIGN KEY(CityID)
		REFERENCES Cities(CityID)
);

CREATE TABLE Orders (
	OrderID int PRIMARY KEY IDENTITY,
	CustomerID int NOT NULL,
	CONSTRAINT FK_Orders_Customers
		FOREIGN KEY(CustomerID)
		REFERENCES Customers(CustomerID)
);

CREATE TABLE ItemTypes (
	ItemTypeID int PRIMARY KEY IDENTITY,
	[Name] varchar(50) NOT NULL
);

CREATE TABLE Items (
	ItemID int PRIMARY KEY IDENTITY,
	[Name] varchar(50) NOT NULL,
	ItemTypeID int NOT NULL,
	CONSTRAINT FK_Items_ItemTypes
		FOREIGN KEY(ItemTypeID)
		REFERENCES ItemTypes(ItemTypeID)
);

CREATE TABLE OrderItems (
	OrderID int NOT NULL,
	ItemID int NOT NULL,
	CONSTRAINT FK_OrderItems_Orders
		FOREIGN KEY(OrderID)
		REFERENCES Orders(OrderID),
	CONSTRAINT FK_OrderItems_Items
		FOREIGN KEY(ItemID)
		REFERENCES Items(ItemID),
	CONSTRAINT PK_OrderItems
		PRIMARY KEY(OrderID, ItemID)
);
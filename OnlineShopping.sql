DROP DATABASE OnlineStore;

CREATE DATABASE OnlineStore;
USE OnlineStore;

CREATE TABLE Category (
CategoryID INT PRIMARY KEY,
Description VARCHAR(200),
CategoryName VARCHAR(10)
);

CREATE TABLE Promotion (
PromoID INT PRIMARY KEY,
PromotionName VARCHAR(50),
DiscountType VARCHAR(50),
DiscountValue DECIMAL(10,2),
MinOrderValue DECIMAL(10,2),
StartDate DATE,
EndDate DATE,
ApplicableTo VARCHAR(50)
);

CREATE TABLE ShippingMethod (
ShippingMethodID INT PRIMARY KEY,
MethodName VARCHAR(50),
EstDeliveryTime DATE,
BaseCost DECIMAL(10,2),
FreeShippingThreshold INT,
LocalOnly VARCHAR(20),
ShippingCost DECIMAL(10,2)
);

CREATE TABLE Customer (
CustomerID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Email VARCHAR(100),
Password VARCHAR(250),
PhoneNumber VARCHAR(20),
ShippingAddress VARCHAR(250),
AccountCreationDate DATETIME,
LoyaltyPts INT
);

CREATE TABLE Product (
ProductID INT PRIMARY KEY,
ProductName VARCHAR(50),
Description VARCHAR(200),
Price Double,
Stock INT,
CategoryID INT,
FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

CREATE TABLE ClientOrder (
OrderID INT PRIMARY KEY,
CustomerID INT,
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
OrderDate DATE,
OrderStatus VARCHAR(20),
TotalAmount DECIMAL(10,2),
DiscountApplied DECIMAL(10,2),
ShippingCost DECIMAL(10,2),
DeliveryAddress VARCHAR(250),
PaymentStatus VARCHAR(20)
);

CREATE TABLE OrderItem (
OrderItemID INT PRIMARY KEY,
OrderID INT,
FOREIGN KEY (OrderID) REFERENCES ClientOrder(OrderID),
ProductID INT,
FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
Quantity INT,
PriceAtPurchase DECIMAL(10,2),
Subtotal DECIMAL(10,2),
Weight DECIMAL(10,2)
);

CREATE TABLE Payment (
PaymentID INT PRIMARY KEY,
OrderID INT,
FOREIGN KEY (OrderID) REFERENCES ClientOrder(OrderID),
PaymentMethod VARCHAR(50),
PaymentDate DATETIME,
AmountPaid DECIMAL(10,2),
PaymentStatus VARCHAR(20)
);

CREATE TABLE LoyaltyProgram (
LoyaltyRecordID INT PRIMARY KEY,
CustomerID INT,
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
PointsEarned INT,
PointsRedeemed INT,
TransactionDate DATE,
OrderID INT,
FOREIGN KEY (OrderID) REFERENCES ClientOrder(OrderID),
PointsBalance INT
);


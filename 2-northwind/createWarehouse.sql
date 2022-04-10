-- NORTHWIND DATA WAREHOUSE

USE [Northwind_SkenderSPTEST2] -- TODO RENAME
GO

-- NORTH DIM TABLES
CREATE TABLE [dbo].[dCustomers] (
    [CustomerID] INT IDENTITY NOT NULL PRIMARY KEY,
    [CustomerIDDB] VARCHAR(5) UNIQUE,
    [CompanyName] VARCHAR(50),
    [ContactName] VARCHAR(50),
    [ContactTitle] VARCHAR(50),
    [Address] VARCHAR(50),
    [PostalCode] VARCHAR(20),
    [CityName] VARCHAR(50),
    [Region] VARCHAR(50),
    [Country] VARCHAR(50),
    [Phone] VARCHAR(20),
    [Fax] VARCHAR(20)
)

-- EAST DIM TABLES
CREATE TABLE [dbo].[dEmployees] (
    [EmployeeID] INT IDENTITY NOT NULL PRIMARY KEY,
    [LastName] VARCHAR(50),
    [FirstName] VARCHAR(50),
    [Title] VARCHAR(50),
    [TitleOfCourtesy] VARCHAR(50),
    [BirthDate] DATE,
    [HireDate] DATE,
    [Address] VARCHAR(50),
    [PostalCode] VARCHAR(20),
    [CityName] VARCHAR(50),
    [Region] VARCHAR(50),
    [Country] VARCHAR(50),    
    [HomePhone] VARCHAR(20),
    [Extension] VARCHAR(10),
    [Notes] VARCHAR(1000),
    [ReportsTo] INT
)

CREATE TABLE [dbo].[dShippers] (
    [ShipperID] INT IDENTITY NOT NULL PRIMARY KEY,
    [CompanyName] VARCHAR(50),
    [Phone] VARCHAR(20)
)

-- WEST DIM TABLES
CREATE TABLE [dbo].[dProducts] (
    [ProductID] INT IDENTITY NOT NULL PRIMARY KEY,
    [ProductName] VARCHAR(100),
    [SupplierCompanyName] VARCHAR(50),
    [SupplierContactName] VARCHAR(50),
    [SupplierContactTitle] VARCHAR(50),
    [SupplierAddress] VARCHAR(50),
    [SupplierPostalCode] VARCHAR(20),
    [SupplierCityName] VARCHAR(50),
    [SupplierRegion] VARCHAR(50),
    [SupplierCountry] VARCHAR(50),
    [SupplierPhone] VARCHAR(20),
    [SupplierFax] VARCHAR(20),
    [SupplierHomePage] VARCHAR(100),
    [CategoryName] VARCHAR(50),
    [CategoryDescription] VARCHAR(100),
    [CountryOfOrigin] VARCHAR(20),
    [QuantityPerUnit] VARCHAR(50),
    [UnitPrice] DECIMAL(2),
    [UnitsInStock] INT
)

-- ADDITIONAL TABLES
CREATE TABLE [dbo].[dPaymentMethod] (
    [PaymentMethodID] INT IDENTITY NOT NULL PRIMARY KEY,
    [PaymentMethod] VARCHAR(10)
)

CREATE TABLE [dbo].[dShippments] (
    [ShippmentID] INT IDENTITY NOT NULL PRIMARY KEY,
    [ShipName] VARCHAR(50),
    [ShipAddress] VARCHAR(50),
    [PostalCode] VARCHAR(20),
    [CityName] VARCHAR(50),
    [Region] VARCHAR(50),
    [Country] VARCHAR(50),
)

CREATE TABLE [dbo].[dDiscounts] (
    [DiscountID] INT IDENTITY NOT NULL PRIMARY KEY,
    [DiscountDesc] VARCHAR(100)
)

-- FACT TABLES
CREATE TABLE [dbo].[fOrderItems] (
    [OrderItemID] INT IDENTITY NOT NULL PRIMARY KEY,
    [OrderID] INT,
    [ProductID] INT,
    [CustomerID] INT,
    [EmployeeID] INT,
    [PaymentMethodID] INT,
    [ShipperID] INT,
    [ShippmentID] INT,
    [OrderDateID] INT,
    [OrderTimeID] INT,
    [RequiredDateID] INT,
    [RequiredTimeID] INT,
    [ShippedDateID] INT,
    [ShippedTimeID] INT,
    [UnitPrice] DECIMAL(2),
    [Quantity] INT,
    [Discount] DECIMAL(2),
    [DiscountID] INT,
    [UnitPriceWithDiscount] DECIMAL(2)
)

CREATE TABLE [dbo].[fOrders] (
    [OrderID] INT IDENTITY NOT NULL PRIMARY KEY,
    [CustomerID] INT,
    [EmployeeID] INT,
    [PaymentMethodID] INT,
    [ShipperID] INT,
    [ShippmentID] INT,
    [OrderDateID] INT,
    [OrderTimeID] INT,
    [RequiredDateID] INT,
    [RequiredTimeID] INT,
    [ShippedDateID] INT,
    [ShippedTimeID] INT,
    [ProductsNumber] INT,
    [DistinctProductsNumber] INT,
    [Freight] DECIMAL(2),
    [TotalItemsPrice] DECIMAL(2),
    [TotalItemsPriceWithFreight] DECIMAL(2),
    [DiscountApplied] BIT,
    [TotalDiscount] DECIMAL(2),
    [TotalItemsPriceWithoutDiscount] DECIMAL(2),
    [OrderedToShippedHours] INT,
    [OrderedToRequiredHours] INT,
    [ShippedToRequiredHours] INT,
    [Shipped] BIT,
    [Delivered] BIT
)
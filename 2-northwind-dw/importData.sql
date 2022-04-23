-- IMPORT DATA TO NORTHWIND DATA WAREHOUSE

USE [Northwind_SkenderSP]
GO

-- IMPORT CUSTOMERS
INSERT INTO [dbo].[dCustomers] (
    [CustomerIDDB],
    [CompanyName],
    [ContactName],
    [ContactTitle],
    [Address],
    [PostalCode],
    [CityName],
    [Region],
    [Country],
    [Phone],
    [Fax]
)
SELECT
    [CustomerID],
    [CompanyName],
    [ContactName],
    [ContactTitle],
    [Address],
    [PostalCode],
    [CityName],
    [Region],
    [Country],
    [Phone],
    [Fax]
FROM
    [NorthWind2015].[dbo].[Customers]
LEFT JOIN
    [NorthWind2015].[dbo].[City]
ON [NorthWind2015].[dbo].[Customers].[CityID] = [NorthWind2015].[dbo].[City].[CityID]

UPDATE [dbo].[dCustomers] SET [CompanyName] = 'unknown' WHERE [CompanyName] IS NULL
UPDATE [dbo].[dCustomers] SET [ContactName] = 'unknown' WHERE [ContactName] IS NULL
UPDATE [dbo].[dCustomers] SET [ContactTitle] = 'unknown' WHERE [ContactTitle] IS NULL
UPDATE [dbo].[dCustomers] SET [Address] = 'unknown' WHERE [Address] IS NULL
UPDATE [dbo].[dCustomers] SET [PostalCode] = 'unknown' WHERE [PostalCode] IS NULL
UPDATE [dbo].[dCustomers] SET [CityName] = 'unknown' WHERE [CityName] IS NULL
UPDATE [dbo].[dCustomers] SET [Region] = 'unknown' WHERE [Region] IS NULL
UPDATE [dbo].[dCustomers] SET [Country] = 'unknown' WHERE [Country] IS NULL
UPDATE [dbo].[dCustomers] SET [Phone] = 'unknown' WHERE [Phone] IS NULL
UPDATE [dbo].[dCustomers] SET [Fax] = 'unknown' WHERE [Fax] IS NULL


-- IMPORT EMPLOYEES
INSERT INTO [dbo].[dEmployees] (
    [LastName],
    [FirstName],
    [Title],
    [TitleOfCourtesy],
    [BirthDate],
    [HireDate],
    [Address],
    [PostalCode],
    [CityName],
    [Region],
    [Country],
    [HomePhone],
    [Extension],
    [Notes],
    [ReportsTo]
)
SELECT
    [LastName],
    [FirstName],
    [Title],
    [TitleOfCourtesy],
    [BirthDate],
    [HireDate],
    [Address],
    [PostalCode],
    [CityName],
    [Region],
    [Country],
    [HomePhone],
    [Extension],
    [Notes],
    [ReportsTo]
FROM
    [NorthWind2015].[dbo].[Employees]
LEFT JOIN
    [NorthWind2015].[dbo].[City]
ON [NorthWind2015].[dbo].[Employees].[CityID] = [NorthWind2015].[dbo].[City].[CityID]

UPDATE [dbo].[dEmployees] SET [LastName] = 'unknown' WHERE [LastName] IS NULL
UPDATE [dbo].[dEmployees] SET [FirstName] = 'unknown' WHERE [FirstName] IS NULL
UPDATE [dbo].[dEmployees] SET [Title] = 'unknown' WHERE [Title] IS NULL
UPDATE [dbo].[dEmployees] SET [TitleOfCourtesy] = 'unknown' WHERE [TitleOfCourtesy] IS NULL
UPDATE [dbo].[dEmployees] SET [Address] = 'unknown' WHERE [Address] IS NULL
UPDATE [dbo].[dEmployees] SET [PostalCode] = 'unknown' WHERE [PostalCode] IS NULL
UPDATE [dbo].[dEmployees] SET [CityName] = 'unknown' WHERE [CityName] IS NULL
UPDATE [dbo].[dEmployees] SET [Region] = 'unknown' WHERE [Region] IS NULL
UPDATE [dbo].[dEmployees] SET [Country] = 'unknown' WHERE [Country] IS NULL
UPDATE [dbo].[dEmployees] SET [HomePhone] = 'unknown' WHERE [HomePhone] IS NULL
UPDATE [dbo].[dEmployees] SET [Extension] = 'unknown' WHERE [Extension] IS NULL
UPDATE [dbo].[dEmployees] SET [Notes] = 'unknown' WHERE [Notes] IS NULL
UPDATE [dbo].[dEmployees] SET [ReportsTo] = 0 WHERE [ReportsTo] IS NULL


-- IMPORT SHIPPERS
INSERT INTO [dbo].[dShippers] (
    [CompanyName],
    [Phone]
)
SELECT
    [CompanyName],
    [Phone]
FROM
    [NorthWind2015].[dbo].[Shippers]

UPDATE [dbo].[dShippers] SET [CompanyName] = 'unknown' WHERE [CompanyName] IS NULL
UPDATE [dbo].[dShippers] SET [Phone] = 'unknown' WHERE [Phone] IS NULL


-- IMPORT PRODUCTS
INSERT INTO [dbo].[dProducts] (
    [ProductName],
    [SupplierCompanyName],
    [SupplierContactName],
    [SupplierContactTitle],
    [SupplierAddress],
    [SupplierPostalCode],
    [SupplierCityName],
    [SupplierRegion],
    [SupplierCountry],
    [SupplierPhone],
    [SupplierFax],
    [SupplierHomePage],
    [CategoryName],
    [CategoryDescription],
    [CountryOfOrigin],
    [QuantityPerUnit],
    [UnitPrice],
    [UnitsInStock]
)
SELECT
    [ProductName],
    [CompanyName],
    [ContactName],
    [ContactTitle],
    [Address],
    [PostalCode],
    [CityName],
    [Region],
    [Country],
    [Phone],
    [Fax],
    [HomePage],
    [CategoryName],
    [Description],
    [CountryOfOrigin],
    [QuantityPerUnit],
    [UnitPrice],
    [UnitsInStock]
FROM
    [NorthWind2015].[dbo].[Products]
LEFT JOIN
    [NorthWind2015].[dbo].[Suppliers]
ON
    [NorthWind2015].[dbo].[Products].[SupplierID] = [NorthWind2015].[dbo].[Suppliers].[SupplierID]
LEFT JOIN
    [NorthWind2015].[dbo].[City]
ON
    [NorthWind2015].[dbo].[Suppliers].[CityID] = [NorthWind2015].[dbo].[City].[CityID]
LEFT JOIN
    [NorthWind2015].[dbo].[Categories]
ON
    [NorthWind2015].[dbo].[Products].[CategoryID] = [NorthWind2015].[dbo].[Categories].[CategoryID]

UPDATE [dbo].[dProducts] SET [ProductName] = 'unknown' WHERE [ProductName] IS NULL
UPDATE [dbo].[dProducts] SET [SupplierCompanyName] = 'unknown' WHERE [SupplierCompanyName] IS NULL
UPDATE [dbo].[dProducts] SET [SupplierContactName] = 'unknown' WHERE [SupplierContactName] IS NULL
UPDATE [dbo].[dProducts] SET [SupplierContactTitle] = 'unknown' WHERE [SupplierContactTitle] IS NULL
UPDATE [dbo].[dProducts] SET [SupplierAddress] = 'unknown' WHERE [SupplierAddress] IS NULL
UPDATE [dbo].[dProducts] SET [SupplierPostalCode] = 'unknown' WHERE [SupplierPostalCode] IS NULL
UPDATE [dbo].[dProducts] SET [SupplierCityName] = 'unknown' WHERE [SupplierCityName] IS NULL
UPDATE [dbo].[dProducts] SET [SupplierRegion] = 'unknown' WHERE [SupplierRegion] IS NULL
UPDATE [dbo].[dProducts] SET [SupplierCountry] = 'unknown' WHERE [SupplierCountry] IS NULL
UPDATE [dbo].[dProducts] SET [SupplierPhone] = 'unknown' WHERE [SupplierPhone] IS NULL
UPDATE [dbo].[dProducts] SET [SupplierFax] = 'unknown' WHERE [SupplierFax] IS NULL
UPDATE [dbo].[dProducts] SET [SupplierHomePage] = 'unknown' WHERE [SupplierHomePage] IS NULL
UPDATE [dbo].[dProducts] SET [CategoryName] = 'unknown' WHERE [CategoryName] IS NULL
UPDATE [dbo].[dProducts] SET [CategoryDescription] = 'unknown' WHERE [CategoryDescription] IS NULL
UPDATE [dbo].[dProducts] SET [CountryOfOrigin] = 'unknown' WHERE [CountryOfOrigin] IS NULL


-- IMPORT PAYMENT METHODS
INSERT INTO [dbo].[dPaymentMethods] (
    [PaymentMethod]
)
SELECT DISTINCT
    [PaymentMethod]
FROM
    [NorthWind2015].[dbo].[Orders]

UPDATE [dbo].[dPaymentMethods] SET [PaymentMethod] = 'unknown' WHERE [PaymentMethod] IS NULL


-- IMPORT SHIPMENTS
INSERT INTO [dbo].[dShippments] (
    [ShipName],
    [ShipAddress],
    [PostalCode],
    [CityName],
    [Region],
    [Country]
)
SELECT DISTINCT
    [ShipName],
    [ShipAddress],
    [PostalCode],
    [CityName],
    [Region],
    [Country]
FROM
    [NorthWind2015].[dbo].[Orders]
LEFT JOIN
    [NorthWind2015].[dbo].[City]
ON
    [NorthWind2015].[dbo].[Orders].[ShipCityID] = [NorthWind2015].[dbo].[City].[CityID]

UPDATE [dbo].[dShippments] SET [ShipName] = 'unknown' WHERE [ShipName] IS NULL
UPDATE [dbo].[dShippments] SET [ShipAddress] = 'unknown' WHERE [ShipAddress] IS NULL
UPDATE [dbo].[dShippments] SET [PostalCode] = 'unknown' WHERE [PostalCode] IS NULL
UPDATE [dbo].[dShippments] SET [CityName] = 'unknown' WHERE [CityName] IS NULL
UPDATE [dbo].[dShippments] SET [Region] = 'unknown' WHERE [Region] IS NULL
UPDATE [dbo].[dShippments] SET [Country] = 'unknown' WHERE [Country] IS NULL


-- IMPORT DISCOUNTS
INSERT INTO [dbo].[dDiscounts] (
    [DiscountDesc]
)
SELECT DISTINCT
    [DiscountDesc]
FROM
    [NorthWind2015].[dbo].[OrderItems]

UPDATE [dbo].[dDiscounts] SET [DiscountDesc] = 'unknown' WHERE [DiscountDesc] IS NULL


-- IMPORT ORDER ITEMS
INSERT INTO [dbo].[cOrderItems] (
    [OrderID],
    [ProductID],
    [CustomerID],
    [EmployeeID],
    [PaymentMethodID],
    [ShipperID],
    [ShippmentID],
    [OrderDateID],
    [OrderTimeID],
    [RequiredDateID],
    [RequiredTimeID],
    [ShippedDateID],
    [ShippedTimeID],
    [UnitPrice],
    [Quantity],
    [Discount],
    [DiscountID],
    [UnitPriceWithDiscount]
)
SELECT
    [NorthWind2015].[dbo].[OrderItems].[OrderId],
    [NorthWind2015].[dbo].[OrderItems].[ProductID],
    [dbo].[dCustomers].[CustomerID],
    [NorthWind2015].[dbo].[Orders].[EmployeeID],
    [dbo].[dPaymentMethods].[PaymentMethodID],
    [dbo].[dShippers].[ShipperID],
    (
        SELECT TOP 1
            [dbo].[dShippments].[ShippmentID]
        FROM
            [dbo].[dShippments]
        WHERE
            [dbo].[dShippments].[ShipName] = [NorthWind2015].[dbo].[Orders].[ShipName]
        AND
            [dbo].[dShippments].[ShipAddress] = [NorthWind2015].[dbo].[Orders].[ShipAddress]
    ),
    [OrderDateTable].[idDate],
    [OrderTimeTable].[idTimeOfDay],
    [ShippedDateTable].[idDate],
    [ShippedTimeTable].[idTimeOfDay],
    [RequiredDateTable].[idDate],
    [RequiredTimeTable].[idTimeOfDay],
    [NorthWind2015].[dbo].[OrderItems].[UnitPrice],
    [NorthWind2015].[dbo].[OrderItems].[Quantity],
    IIF([NorthWind2015].[dbo].[OrderItems].[Discount] > 0.0, 1, 0),
    [dbo].[dDiscounts].[DiscountID],
    [NorthWind2015].[dbo].[OrderItems].[UnitPrice] * (1 - [NorthWind2015].[dbo].[OrderItems].[Discount])
FROM
    [NorthWind2015].[dbo].[OrderItems]
LEFT JOIN
    [NorthWind2015].[dbo].[Orders]
ON
    [NorthWind2015].[dbo].[OrderItems].[OrderID] = [NorthWind2015].[dbo].[Orders].[OrderID]
LEFT JOIN
    [dbo].[dPaymentMethods]
ON
    [NorthWind2015].[dbo].[Orders].[PaymentMethod] = [dbo].[dPaymentMethods].[PaymentMethod]
LEFT JOIN
    [dbo].[dCustomers]
ON
    [NorthWind2015].[dbo].[Orders].[CustomerID] = [dbo].[dCustomers].[CustomerIDDB]
LEFT JOIN
    [dbo].[dShippers]
ON
    [NorthWind2015].[dbo].[Orders].[ShipVia] = [dbo].[dShippers].[ShipperID]
LEFT JOIN
    [dbo].[dDiscounts]
ON
    [NorthWind2015].[dbo].[OrderItems].[DiscountDesc] = [dbo].[dDiscounts].[DiscountDesc]
LEFT JOIN
    [dbo].[dDate] AS [OrderDateTable]
ON
    CONVERT(DATE, [NorthWind2015].[dbo].[Orders].[OrderDate]) = [OrderDateTable].[date]
LEFT JOIN
    [dbo].[dDate] AS [ShippedDateTable]
ON
    CONVERT(DATE, [NorthWind2015].[dbo].[Orders].[ShippedDate]) = [ShippedDateTable].[date]
LEFT JOIN
    [dbo].[dDate] AS [RequiredDateTable]
ON
    CONVERT(DATE, [NorthWind2015].[dbo].[Orders].[RequiredDate]) = [RequiredDateTable].[date]
LEFT JOIN
    [dbo].[dTimeOfDay] AS [OrderTimeTable]
ON
    CONVERT(TIME, [NorthWind2015].[dbo].[Orders].[OrderDate]) = [OrderTimeTable].[formattedTime]
LEFT JOIN
    [dbo].[dTimeOfDay] AS [ShippedTimeTable]
ON
    CONVERT(TIME, [NorthWind2015].[dbo].[Orders].[ShippedDate]) = [ShippedTimeTable].[formattedTime]
LEFT JOIN
    [dbo].[dTimeOfDay] AS [RequiredTimeTable]
ON
    CONVERT(TIME, [NorthWind2015].[dbo].[Orders].[RequiredDate]) = [RequiredTimeTable].[formattedTime]

DECLARE @UnknownPaymentMethodID INT =
    (
        SELECT TOP 1 [PaymentMethodID]
        FROM [dbo].[dPaymentMethods]
        WHERE [PaymentMethod] = 'unknown'
    )

DECLARE @UnknownDiscountID INT =
    (
        SELECT TOP 1 [DiscountID]
        FROM [dbo].[dDiscounts]
        WHERE [DiscountDesc] = 'unknown'
    )

UPDATE [dbo].[cOrderItems] SET [PaymentMethodID] = @UnknownPaymentMethodID WHERE [PaymentMethodID] IS NULL
UPDATE [dbo].[cOrderItems] SET [ShippmentID] = 1 WHERE [ShippmentID] IS NULL
UPDATE [dbo].[cOrderItems] SET [RequiredDateID] = 1 WHERE [RequiredDateID] IS NULL
UPDATE [dbo].[cOrderItems] SET [RequiredTimeID] = 1 WHERE [RequiredTimeID] IS NULL
UPDATE [dbo].[cOrderItems] SET [ShippedDateID] = 1 WHERE [ShippedDateID] IS NULL
UPDATE [dbo].[cOrderItems] SET [ShippedTimeID] = 1 WHERE [ShippedTimeID] IS NULL
UPDATE [dbo].[cOrderItems] SET [DiscountID] = @UnknownDiscountID WHERE [DiscountID] IS NULL


-- IMPORT ORDERS
INSERT INTO [dbo].[cOrders] (
    [OrderID],
    [CustomerID],
    [EmployeeID],
    [PaymentMethodID],
    [ShipperID],
    [ShippmentID],
    [OrderDateID],
    [OrderTimeID],
    [RequiredDateID],
    [RequiredTimeID],
    [ShippedDateID],
    [ShippedTimeID],
    [ProductsNumber],
    [DistinctProductsNumber],
    [Freight],
    [TotalItemsPrice],
    [TotalItemsPriceWithFreight],
    [TotalDiscount],
    [TotalItemsPriceWithoutDiscount],
    [OrderedToShippedDuration],
    [Shipped]
)
SELECT
    CASE
        WHEN [NorthWind2015].[dbo].[OrderItems].[OrderId] IS NULL
            THEN 11088
        ELSE
            [NorthWind2015].[dbo].[OrderItems].[OrderId]
    END,
    [dbo].[dCustomers].[CustomerID],
    [NorthWind2015].[dbo].[Orders].[EmployeeID],
    [dbo].[dPaymentMethods].[PaymentMethodID],
    [dbo].[dShippers].[ShipperID],
    [dbo].[dShippments].[ShippmentID],
    [OrderDateTable].[idDate],
    [OrderTimeTable].[idTimeOfDay],
    [ShippedDateTable].[idDate],
    [ShippedTimeTable].[idTimeOfDay],
    [RequiredDateTable].[idDate],
    [RequiredTimeTable].[idTimeOfDay],
    SUM([NorthWind2015].[dbo].[OrderItems].[Quantity]),
    COUNT(DISTINCT [NorthWind2015].[dbo].[OrderItems].[ProductID]),
    [NorthWind2015].[dbo].[Orders].[Freight],
    SUM((1.0 * [NorthWind2015].[dbo].[OrderItems].[UnitPrice] * (1.0 -  [NorthWind2015].[dbo].[OrderItems].[Discount])) * [NorthWind2015].[dbo].[OrderItems].[Quantity]),
    SUM((1.0 * [NorthWind2015].[dbo].[OrderItems].[UnitPrice] * (1.0 -  [NorthWind2015].[dbo].[OrderItems].[Discount])) * [NorthWind2015].[dbo].[OrderItems].[Quantity]) + [NorthWind2015].[dbo].[Orders].[Freight],
    SUM([NorthWind2015].[dbo].[OrderItems].[UnitPrice] * [NorthWind2015].[dbo].[OrderItems].[Quantity]) - SUM((1.0 * [NorthWind2015].[dbo].[OrderItems].[UnitPrice] * (1.0 -  [NorthWind2015].[dbo].[OrderItems].[Discount])) * [NorthWind2015].[dbo].[OrderItems].[Quantity]),
    SUM([NorthWind2015].[dbo].[OrderItems].[UnitPrice] * [NorthWind2015].[dbo].[OrderItems].[Quantity]),
    CASE
        WHEN [NorthWind2015].[dbo].[Orders].[ShippedDate] IS NULL
            THEN 0
        WHEN [NorthWind2015].[dbo].[Orders].[OrderDate] IS NULL
            THEN 0
        ELSE
            DATEDIFF(second , [OrderDate], [ShippedDate])
    END,
    CASE
        WHEN [NorthWind2015].[dbo].[Orders].[ShippedDate] IS NULL THEN 0
        ELSE 1
    END
FROM
    [NorthWind2015].[dbo].[Orders]
LEFT JOIN
    [NorthWind2015].[dbo].[OrderItems]
ON
    [NorthWind2015].[dbo].[OrderItems].[OrderID] = [NorthWind2015].[dbo].[Orders].[OrderID]
LEFT JOIN
    [dbo].[dPaymentMethods]
ON
    [NorthWind2015].[dbo].[Orders].[PaymentMethod] = [dbo].[dPaymentMethods].[PaymentMethod]
LEFT JOIN
    [dbo].[dCustomers]
ON
    [NorthWind2015].[dbo].[Orders].[CustomerID] = [dbo].[dCustomers].[CustomerIDDB]
LEFT JOIN
    [dbo].[dShippers]
ON
    [NorthWind2015].[dbo].[Orders].[ShipVia] = [dbo].[dShippers].[ShipperID]
LEFT JOIN
    [dbo].[dShippments]
ON
    [NorthWind2015].[dbo].[Orders].[ShipName] = [dbo].[dShippments].[ShipName]
    AND
    [NorthWind2015].[dbo].[Orders].[ShipAddress] = [dbo].[dShippments].[ShipAddress]
LEFT JOIN
    [dbo].[dDate] AS [OrderDateTable]
ON
    CONVERT(DATE, [NorthWind2015].[dbo].[Orders].[OrderDate]) = [OrderDateTable].[date]
LEFT JOIN
    [dbo].[dDate] AS [ShippedDateTable]
ON
    CONVERT(DATE, [NorthWind2015].[dbo].[Orders].[ShippedDate]) = [ShippedDateTable].[date]
LEFT JOIN
    [dbo].[dDate] AS [RequiredDateTable]
ON
    CONVERT(DATE, [NorthWind2015].[dbo].[Orders].[RequiredDate]) = [RequiredDateTable].[date]
LEFT JOIN
    [dbo].[dTimeOfDay] AS [OrderTimeTable]
ON
    CONVERT(TIME, [NorthWind2015].[dbo].[Orders].[OrderDate]) = [OrderTimeTable].[formattedTime]
LEFT JOIN
    [dbo].[dTimeOfDay] AS [ShippedTimeTable]
ON
    CONVERT(TIME, [NorthWind2015].[dbo].[Orders].[ShippedDate]) = [ShippedTimeTable].[formattedTime]
LEFT JOIN
    [dbo].[dTimeOfDay] AS [RequiredTimeTable]
ON
    CONVERT(TIME, [NorthWind2015].[dbo].[Orders].[RequiredDate]) = [RequiredTimeTable].[formattedTime]
GROUP BY
    [NorthWind2015].[dbo].[Orders].[OrderID],
    [NorthWind2015].[dbo].[OrderItems].[OrderID],
    [NorthWind2015].[dbo].[Orders].[CustomerID],
    [dbo].[dCustomers].[CustomerID],
    [NorthWind2015].[dbo].[Orders].[EmployeeID],
    [NorthWind2015].[dbo].[Orders].[PaymentMethod],
    [dbo].[dPaymentMethods].[PaymentMethodID],
    [NorthWind2015].[dbo].[Orders].[ShipVia],
    [dbo].[dShippments].[ShippmentID],
    [dbo].[dShippers].[ShipperID],
    [NorthWind2015].[dbo].[Orders].[ShipName],
    [NorthWind2015].[dbo].[Orders].[ShipCityId],
    [NorthWind2015].[dbo].[Orders].[OrderDate],
    [NorthWind2015].[dbo].[Orders].[RequiredDate],
    [NorthWind2015].[dbo].[Orders].[ShippedDate],
    [NorthWind2015].[dbo].[Orders].[Freight],
    [OrderDateTable].[idDate],
    [ShippedDateTable].[idDate],
    [RequiredDateTable].[idDate],
    [OrderTimeTable].[idTimeOfDay],
    [ShippedTimeTable].[idTimeOfDay],
    [RequiredTimeTable].[idTimeOfDay]

UPDATE [dbo].[cOrders] SET [PaymentMethodID] = @UnknownPaymentMethodID WHERE [PaymentMethodID] IS NULL
UPDATE [dbo].[cOrders] SET [ShippmentID] = 1 WHERE [ShippmentID] IS NULL
UPDATE [dbo].[cOrders] SET [RequiredDateID] = 1 WHERE [RequiredDateID] IS NULL
UPDATE [dbo].[cOrders] SET [RequiredTimeID] = 1 WHERE [RequiredTimeID] IS NULL
UPDATE [dbo].[cOrders] SET [ShippedDateID] = 1 WHERE [ShippedDateID] IS NULL
UPDATE [dbo].[cOrders] SET [ShippedTimeID] = 1 WHERE [ShippedTimeID] IS NULL


-- ADD CONSTRAINTS
ALTER TABLE [dbo].[cOrders] ADD CONSTRAINT PK_cOrders PRIMARY KEY (OrderID)
ALTER TABLE [dbo].[cOrderItems] ADD CONSTRAINT PK_cOrderItems PRIMARY KEY (OrderID, ProductID)

ALTER TABLE [dbo].[cOrderItems] ADD CONSTRAINT FK_cOrderItems_OrderID FOREIGN KEY (OrderID) REFERENCES [dbo].[cOrders](OrderID)
ALTER TABLE [dbo].[cOrderItems] ADD CONSTRAINT FK_cOrderItems_ProductID FOREIGN KEY (ProductID) REFERENCES [dbo].[dProducts](ProductID)
ALTER TABLE [dbo].[cOrderItems] ADD CONSTRAINT FK_cOrderItems_CustomerID FOREIGN KEY (CustomerID) REFERENCES [dbo].[dCustomers](CustomerID)
ALTER TABLE [dbo].[cOrderItems] ADD CONSTRAINT FK_cOrderItems_EmployeeID FOREIGN KEY (EmployeeID) REFERENCES [dbo].[dEmployees](EmployeeID)
ALTER TABLE [dbo].[cOrderItems] ADD CONSTRAINT FK_cOrderItems_PaymentMethodID FOREIGN KEY (PaymentMethodID) REFERENCES [dbo].[dPaymentMethods](PaymentMethodID)
ALTER TABLE [dbo].[cOrderItems] ADD CONSTRAINT FK_cOrderItems_ShipperID FOREIGN KEY (ShipperID) REFERENCES [dbo].[dShippers](ShipperID)
ALTER TABLE [dbo].[cOrderItems] ADD CONSTRAINT FK_cOrderItems_ShippmentID FOREIGN KEY (ShippmentID) REFERENCES [dbo].[dShippments](ShippmentID)
ALTER TABLE [dbo].[cOrderItems] ADD CONSTRAINT FK_cOrderItems_OrderDateID FOREIGN KEY (OrderDateID) REFERENCES [dbo].[dDate](idDate)
ALTER TABLE [dbo].[cOrderItems] ADD CONSTRAINT FK_cOrderItems_OrderTimeID FOREIGN KEY (OrderTimeID) REFERENCES [dbo].[dTimeOfDay](idTimeOfDay)
ALTER TABLE [dbo].[cOrderItems] ADD CONSTRAINT FK_cOrderItems_RequiredDateID FOREIGN KEY (RequiredDateID) REFERENCES [dbo].[dDate](idDate)
ALTER TABLE [dbo].[cOrderItems] ADD CONSTRAINT FK_cOrderItems_RequiredTimeID FOREIGN KEY (RequiredTimeID) REFERENCES [dbo].[dTimeOfDay](idTimeOfDay)
ALTER TABLE [dbo].[cOrderItems] ADD CONSTRAINT FK_cOrderItems_ShippedDateID FOREIGN KEY (ShippedDateID) REFERENCES [dbo].[dDate](idDate)
ALTER TABLE [dbo].[cOrderItems] ADD CONSTRAINT FK_cOrderItems_ShippedTimeID FOREIGN KEY (ShippedTimeID) REFERENCES [dbo].[dTimeOfDay](idTimeOfDay)
ALTER TABLE [dbo].[cOrderItems] ADD CONSTRAINT FK_cOrderItems_DiscountID FOREIGN KEY (DiscountID) REFERENCES [dbo].[dDiscounts](DiscountID)

ALTER TABLE [dbo].[cOrders] ADD CONSTRAINT FK_cOrders_CustomerID FOREIGN KEY (CustomerID) REFERENCES [dbo].[dCustomers](CustomerID)
ALTER TABLE [dbo].[cOrders] ADD CONSTRAINT FK_cOrders_EmployeeID FOREIGN KEY (EmployeeID) REFERENCES [dbo].[dEmployees](EmployeeID)
ALTER TABLE [dbo].[cOrders] ADD CONSTRAINT FK_cOrders_PaymentMethodID FOREIGN KEY (PaymentMethodID) REFERENCES [dbo].[dPaymentMethods](PaymentMethodID)
ALTER TABLE [dbo].[cOrders] ADD CONSTRAINT FK_cOrders_ShipperID FOREIGN KEY (ShipperID) REFERENCES [dbo].[dShippers](ShipperID)
ALTER TABLE [dbo].[cOrders] ADD CONSTRAINT FK_cOrders_ShippmentID FOREIGN KEY (ShippmentID) REFERENCES [dbo].[dShippments](ShippmentID)
ALTER TABLE [dbo].[cOrders] ADD CONSTRAINT FK_cOrders_OrderDateID FOREIGN KEY (OrderDateID) REFERENCES [dbo].[dDate](idDate)
ALTER TABLE [dbo].[cOrders] ADD CONSTRAINT FK_cOrders_OrderTimeID FOREIGN KEY (OrderTimeID) REFERENCES [dbo].[dTimeOfDay](idTimeOfDay)
ALTER TABLE [dbo].[cOrders] ADD CONSTRAINT FK_cOrders_RequiredDateID FOREIGN KEY (RequiredDateID) REFERENCES [dbo].[dDate](idDate)
ALTER TABLE [dbo].[cOrders] ADD CONSTRAINT FK_cOrders_RequiredTimeID FOREIGN KEY (RequiredTimeID) REFERENCES [dbo].[dTimeOfDay](idTimeOfDay)
ALTER TABLE [dbo].[cOrders] ADD CONSTRAINT FK_cOrders_ShippedDateID FOREIGN KEY (ShippedDateID) REFERENCES [dbo].[dDate](idDate)
ALTER TABLE [dbo].[cOrders] ADD CONSTRAINT FK_cOrders_ShippedTimeID FOREIGN KEY (ShippedTimeID) REFERENCES [dbo].[dTimeOfDay](idTimeOfDay)
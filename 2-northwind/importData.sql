-- IMPORT DATA TO NORTHWIND DATA WAREHOUSE

USE [Northwind_SkenderSPTEST5] -- TODO RENAME
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
INSERT INTO [dbo].[dPaymentMethod] (
    [PaymentMethod]
)
SELECT DISTINCT
    [PaymentMethod]
FROM
    [NorthWind2015].[dbo].[Orders]

UPDATE [dbo].[dPaymentMethod] SET [PaymentMethod] = 'unknown' WHERE [PaymentMethod] IS NULL


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
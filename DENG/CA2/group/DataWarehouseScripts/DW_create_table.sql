-- CREATE DATABASE CarSalesDW_B

USE CarSalesDW_B;

DROP TABLE IF EXISTS SalesFact;
DROP TABLE IF EXISTS TimeDIM;
DROP TABLE IF EXISTS orderDIM;
DROP TABLE IF EXISTS productDIM;
DROP TABLE IF EXISTS paymentDIM;
DROP TABLE IF EXISTS customerDIM;
DROP TABLE IF EXISTS employeesDIM;
DROP TABLE IF EXISTS officeDIM;

CREATE TABLE officeDIM (
	officeId INT IDENTITY(1, 1) NOT NULL PRIMARY KEY, 
	officeCode VARCHAR(10) NOT NULL UNIQUE,	
	city VARCHAR(50),
	phone VARCHAR(50),
	addressLine1 VARCHAR(50),
	addressLine2 VARCHAR(50),
	state VARCHAR(50),
	country VARCHAR(50),
	postalCode VARCHAR(15),
	territory VARCHAR(10),
)

CREATE TABLE employeesDIM (
	employeeId INT IDENTITY(1, 1) NOT NULL PRIMARY KEY, 
	employeeNumber INT NOT NULL UNIQUE,
	lastName VARCHAR(50),
	firstName VARCHAR(50),
	extension VARCHAR(10),
	email VARCHAR(100),
	reportsTo INT,
	jobTitle VARCHAR(50),
)


CREATE TABLE customerDIM (
	customerId INT IDENTITY(1, 1) NOT NULL PRIMARY KEY, 
	customerNumber INT NOT NULL UNIQUE,
	customerName VARCHAR(50),
	contactLastName VARCHAR(50),
	contactFirstName VARCHAR(50),
	phone VARCHAR(50),
	addressLine1 VARCHAR(50),
	city VARCHAR(50),
	postalCode VARCHAR(15),
	country VARCHAR(50),
	creditLimit DECIMAL(10,2),
)


CREATE TABLE paymentDIM (
	paymentId INT IDENTITY(1, 1) NOT NULL PRIMARY KEY, 
	customerNumber INT NOT NULL,
	checkNumber VARCHAR(50) NOT NULL UNIQUE,
	paymentDate datetime NULL,
	amount DECIMAL(10,2) NULL,
	
	FOREIGN KEY (customerNumber) REFERENCES customerDIM (customerNumber),
)


CREATE TABLE productDIM (
	productId INT IDENTITY(1, 1) NOT NULL PRIMARY KEY, 
	productCode VARCHAR(50) NOT NULL UNIQUE,
	productName VARCHAR(70),
	productLine VARCHAR(50),
	productScale VARCHAR(10),
	productVendor VARCHAR(50),
	productDescription varchar(max),
	MSRP DECIMAL(10,2),
)


CREATE TABLE orderDIM (
	orderId INT IDENTITY(1, 1) NOT NULL PRIMARY KEY, 
	orderNumber INT NOT NULL UNIQUE,
	orderDate DATETIME,
	requiredDate DATETIME,
	shippedDate DATETIME,
	status VARCHAR(15),
	comments varchar(max),
)


CREATE TABLE timeDIM (
	[timeKey] INT PRIMARY KEY,
    [Date] DATETIME,
    [FullDateUK] CHAR(10), -- Date in dd-MM-yyyy format
    [FullDateUSA] CHAR(10),-- Date in MM-dd-yyyy format
    [DayOfMonth] VARCHAR(2), -- Field will hold day number of Month
    [DaySuffix] VARCHAR(4), -- Apply suffix as 1st, 2nd ,3rd etc
    [DayName] VARCHAR(9), -- Contains name of the day, Sunday, Monday
    [DayOfWeekUSA] CHAR(1),-- First Day Sunday=1 and Saturday=7
    [DayOfWeekUK] CHAR(1),-- First Day Monday=1 and Sunday=7
    [DayOfYear] VARCHAR(3),
    [WeekOfMonth] VARCHAR(1),-- Week Number of Month
    [WeekOfQuarter] VARCHAR(2), --Week Number of the Quarter
    [WeekOfYear] VARCHAR(2),--Week Number of the Year
    [Month] VARCHAR(2), --Number of the Month 1 to 12
    [MonthName] VARCHAR(9),--January, February etc
    [MonthOfQuarter] VARCHAR(2),-- Month Number belongs to Quarter
    [Quarter] CHAR(1),
    [QuarterName] VARCHAR(9),--First,Second..
    [Year] CHAR(4),-- Year value of Date stored in Row
    [YearName] CHAR(7), --CY 2012,CY 2013
    [MonthYear] CHAR(10), --Jan-2013,Feb-2013
    [MMYYYY] CHAR(6),
    [FirstDayOfMonth] DATE,
    [LastDayOfMonth] DATE,
    [FirstDayOfQuarter] DATE,
    [LastDayOfQuarter] DATE,
    [FirstDayOfYear] DATE,
    [LastDayOfYear] DATE,
    [IsHolidayUSA] BIT,-- Flag 1=National Holiday, 0-No National Holiday
    [IsWeekday] BIT,-- 0=Week End ,1=Week Day
    [HolidayUSA] VARCHAR(50),--Name of Holiday in US
    [IsHolidayUK] BIT Null,
    [HolidayUK] VARCHAR(50) Null --Name of Holiday in UK
)


CREATE TABLE SalesFact (
	salesId INT IDENTITY(1, 1) NOT NULL PRIMARY KEY, 
	quantity INT,
	unitPrice Decimal(10,2),
	buyPrice DECIMAL(10,2),
	officeCode VARCHAR(10) NOT NULL,	
	employeeNumber INT NOT NULL,
	customerNumber INT NOT NULL,
	orderNumber INT NOT NULL,
	productCode VARCHAR(50) NOT NULL,
	timeKey INT NOT NULL,

	FOREIGN KEY (customerNumber) REFERENCES customerDIM (customerNumber),
	FOREIGN KEY (officeCode) REFERENCES officeDIM (officeCode),
	FOREIGN KEY (employeeNumber) REFERENCES employeesDIM(employeeNumber),
	FOREIGN KEY (orderNumber) REFERENCES orderDIM (orderNumber),
	FOREIGN KEY (productCode) REFERENCES productDIM (productCode),
	FOREIGN KEY (TimeKey) REFERENCES timeDIM (TimeKey)
	
)





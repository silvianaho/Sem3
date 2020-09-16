/* Script: NorthWind_DW_CreateTables.sql
   Purpose: To create the Dimension and Fact tables of the NorthWind Database
   Date Written: March 2020
*/

-- CREATE DATABASE NorthWindDW;

USE NorthwindDW

CREATE TABLE ShippersDIM (
	ShipperKey int NOT NULL,
	CompanyName varchar(40) NOT NULL,
	Phone varchar(24) NULL,
	PRIMARY KEY (ShipperKey));
	
CREATE TABLE ProductDIM (
	ProductKey int  NOT NULL,
	ProductName varchar(40) NOT NULL,
	Supplier varchar(50) NULL,
	Category varchar(40) NULL,
	QuantityPerUnit varchar(20) NULL,
	Discontinued bit NOT NULL,
	PRIMARY KEY(ProductKey));

CREATE TABLE RegionDIM (
	RegionKey int NOT NULL,
	RegionDesc [varchar](50) NOT NULL,
	PRIMARY KEY(RegionKey));

CREATE TABLE EmployeeDIM(
	EmployeeKey int NOT NULL,
	LastName varchar(20) NOT NULL,
	FirstName varchar(10) NOT NULL,
	Title varchar(30) NULL,
	TitleOfCourtesy varchar(25) NULL,
	BirthDate varchar(50) NULL,
	HireDate varchar(50)  NULL,
	[Address] varchar(60) NULL,
	Country varchar(15) NULL,
	HomePhone varchar(24) NULL,
	Extension varchar(4) NULL,
	Notes text NULL,
	ReportsTo int NULL
	PRIMARY KEY(EmployeeKey) );

CREATE TABLE CustomerDIM(
	CustomerKey char(5) NOT NULL,
	CompanyName varchar(40) NOT NULL,
	ContactName varchar(30) NULL,
	ContactTitle varchar(30) NULL,
	[Address] varchar(60) NULL,
	City varchar(15) NULL,
	Region varchar(15) NULL,
	PostalCode varchar(10) NULL,
	Country varchar(15) NULL,
	Phone varchar(24) NULL,
	Fax varchar(24) NULL,
	PRIMARY KEY(CustomerKey) );

CREATE TABLE	TimeDim
	(	[TimeKey] INT primary key, 
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
);

CREATE TABLE SalesFacts(
	TimeKey int NOT NULL,
	ShipperKey int NOT NULL,
	CustomerKey char(5) NOT NULL,
	EmployeeKey int NOT NULL,
	ProductKey int NOT NULL,
	RegionKey int NOT NULL,
	UnitPrice money NULL,
	Quantity int NULL,
	Discount real NULL,
	CONSTRAINT SalesKey PRIMARY KEY (TimeKey,ShipperKey,CustomerKey,EmployeeKey,ProductKey,RegionKey));


ALTER TABLE SalesFacts  ADD FOREIGN KEY (CustomerKey) REFERENCES CustomerDIM(CustomerKey);
ALTER TABLE SalesFacts  ADD FOREIGN KEY (EmployeeKey) REFERENCES EmployeeDIM(EmployeeKey);
ALTER TABLE SalesFacts  ADD FOREIGN KEY (ProductKey) REFERENCES ProductDIM(ProductKey);
ALTER TABLE SalesFacts  ADD FOREIGN KEY (RegionKey) REFERENCES RegionDIM(RegionKey);
ALTER TABLE SalesFacts  ADD FOREIGN KEY (TimeKey) REFERENCES TimeDIM(TimeKey);
ALTER TABLE SalesFacts  ADD FOREIGN KEY (ShipperKey) REFERENCES ShippersDIM(ShipperKey);

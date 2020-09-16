/* Create Table Script */

--Create Database CarSalesB;

use CarSalesB;

Drop Table if Exists Payments;
Drop Table if Exists OrderDetails;
Drop Table if Exists Orders;
Drop Table if Exists Products;
Drop Table if Exists ProductLines;
Drop Table if Exists Customers;
Drop Table if Exists Employees;
Drop Table if Exists Offices;


create table Offices (
	officeCode VARCHAR(10) PRIMARY KEY,
	city VARCHAR(50),
	phone VARCHAR(50),
	addressLine1 VARCHAR(50),
	addressLine2 VARCHAR(50),
	state VARCHAR(50),
	country VARCHAR(50),
	postalCode VARCHAR(15),
	territory VARCHAR(10),
)

create table Employees (
	employeeNumber INT PRIMARY KEY,
	lastName VARCHAR(50),
	firstName VARCHAR(50),
	extension VARCHAR(10),
	email VARCHAR(100),
	officeCode VARCHAR(10),
	reportsTo INT,
	jobTitle VARCHAR(50),

	Foreign Key (officeCode) References Offices (officeCode)
)


create table Customers (
	customerNumber INT PRIMARY KEY,
	customerName VARCHAR(50),
	contactLastName VARCHAR(50),
	contactFirstName VARCHAR(50),
	phone VARCHAR(50),
	addressLine1 VARCHAR(50),
	addressLine2 VARCHAR(50),
	city VARCHAR(50),
	state VARCHAR(50),
	postalCode VARCHAR(15),
	country VARCHAR(50),
	salesRepEmployeeNumber INT,
	creditLimit DECIMAL(10,2),

	Foreign Key (salesRepEmployeeNumber) References Employees(employeeNumber),

)


create table ProductLines (
	productLine VARCHAR(50) PRIMARY KEY,
	textDescription varchar(max),

)

create table Products (
	productCode VARCHAR(50) PRIMARY KEY,
	productName VARCHAR(70),
	productLine VARCHAR(50),
	productScale VARCHAR(10),
	productVendor VARCHAR(50),
	productDescription varchar(max),
	quantityInStock INT,
	buyPrice DECIMAL(10,2),
	MSRP DECIMAL(10,2),

	Foreign Key (productLine) References ProductLines(ProductLine)
)


create table Orders (
	orderNumber INT PRIMARY KEY,
	orderDate DATETIME,
	requiredDate DATETIME,
	shippedDate DATETIME,
	status VARCHAR(15),
	comments varchar(max),
	customerNumber INT,

	Foreign Key (customerNumber) References Customers(customerNumber),

)

create table OrderDetails (
	orderNumber INT,
	productCode VARCHAR(50),
	quantityOrdered INT,
	priceEach DECIMAL(10,2),
	orderLineNumber SMALLINT,

	Primary key (orderNumber, productCode),
	Foreign Key (orderNumber) References Orders (orderNumber),
	Foreign Key (productCode) References Products (productCode)

)

create table Payments (
	customerNumber INT,
	checkNumber VARCHAR(50),
	paymentDate DATETIME,
	amount DECIMAL(10,2),

	Primary key (customerNumber, checkNumber),
	Foreign Key (customerNumber) References Customers (customerNumber)
)




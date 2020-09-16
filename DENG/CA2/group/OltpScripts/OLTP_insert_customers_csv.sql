USE CarSalesB;

BULK INSERT 
	Customers
FROM 
	'<disk>:\<path to file>\data\CleanedCustomers.csv'
WITH 
	(format='csv')
USE CarSalesB; 
 
DECLARE @Products VARCHAR(MAX);
 
SELECT 
	@Products = BulkColumn
FROM 
	OPENROWSET(BULK '<disk>:\<path to file>\data\Products.json', SINGLE_BLOB) JSON;

INSERT INTO 
	Products
SELECT 
	* 
FROM 
	OpenJSON(@Products, '$') 
WITH 
	(productCode VARCHAR(50) '$.productCode',  
	productName VARCHAR(70) '$.productName',
	productLine VARCHAR(50) '$.productLine',
	productScale VARCHAR(10) '$.productScale',
	productVendor VARCHAR(50) '$.productVendor',
	productDescription VARCHAR(MAX) '$.productDescription',
	quantityInStock INT  '$.quantityInStock',
	buyPrice DECIMAL(10,2) '$.buyPrice',
	MSRP DECIMAL(10,2) '$.MSRP');

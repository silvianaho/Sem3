------------ ShippersDIM --------------
INSERT INTO 
  NorthwindDW..ShippersDIM(ShipperKey, CompanyName, Phone) 
SELECT 
  ShipperID, CompanyName, Phone 
FROM 
  Northwind..Shippers

------------ ProductDIM --------------
DELETE FROM ProductDIM
INSERT INTO 
  NorthwindDW..ProductDIM(ProductKey, ProductName, Supplier, Category, QuantityPerUnit, Discontinued)  
SELECT 
  p.ProductID, p.ProductName, s.CompanyName, c.CategoryName, p.QuantityPerUnit, p.Discontinued 
FROM 
  Northwind..Products p, Northwind..Suppliers s, Northwind..Categories  c
WHERE 
  p.SupplierID=s.SupplierID AND p.CategoryID=c.CategoryID


--------------CustomerDIM------------
DELETE FROM CustomerDIM

INSERT INTO NorthwindDW..CustomerDIM SELECT * FROM Northwind..Customers n


--------------RegionDIM------
DELETE FROM RegionDIM
INSERT INTO 
  NorthwindDW..RegionDIM(RegionKey, RegionDesc) 
SELECT 
  RegionID, RTRIM(RegionDescription) FROM Northwind..Region
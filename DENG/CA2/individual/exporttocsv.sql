USE CarSalesDW_B;

-- To allow advanced options to be changed.  
EXECUTE sp_configure 'show advanced options', 1;  
GO  
-- To update the currently configured value for advanced options.  
RECONFIGURE;  
GO  
-- To enable the feature.  
EXECUTE sp_configure 'xp_cmdshell', 1;  
GO  
-- To update the currently configured value for this feature.  
RECONFIGURE;  
GO  

EXEC master..xp_cmdshell 'BCP CarSalesDW_B.dbo.customerDIM out "D:\SP_SEM_3\ST1501 - DATA ENGINEERING\CA2\individual\csv\customerDIM.csv" -c -t, -T -S DIT-NB1939213\SQLEXPRESS'
EXEC master..xp_cmdshell 'BCP CarSalesDW_B.dbo.employeesDIM out "D:\SP_SEM_3\ST1501 - DATA ENGINEERING\CA2\individual\csv\employeesDIM.csv" -c -t, -T -S DIT-NB1939213\SQLEXPRESS'
EXEC master..xp_cmdshell 'BCP CarSalesDW_B.dbo.officeDIM out "D:\SP_SEM_3\ST1501 - DATA ENGINEERING\CA2\individual\csv\officeDIM.csv" -c -t, -T -S DIT-NB1939213\SQLEXPRESS'
EXEC master..xp_cmdshell 'BCP CarSalesDW_B.dbo.orderDIM out "D:\SP_SEM_3\ST1501 - DATA ENGINEERING\CA2\individual\csv\orderDIM.csv" -c -t, -T -S DIT-NB1939213\SQLEXPRESS'
EXEC master..xp_cmdshell 'BCP CarSalesDW_B.dbo.paymentDIM out "D:\SP_SEM_3\ST1501 - DATA ENGINEERING\CA2\individual\csv\paymentDIM.csv" -c -t, -T -S DIT-NB1939213\SQLEXPRESS'
EXEC master..xp_cmdshell 'BCP CarSalesDW_B.dbo.SalesFact out "D:\SP_SEM_3\ST1501 - DATA ENGINEERING\CA2\individual\csv\SalesFact.csv" -c -t, -T -S DIT-NB1939213\SQLEXPRESS'

-- Template
-- EXEC master..xp_cmdshell 'BCP <database name>.dbo.<table name> out "D:\<path>\<filename>.csv" -c -t, -T -S <server name>'


SELECT name
FROM sys.columns
WHERE object_id = OBJECT_ID('dbo.productDIM');
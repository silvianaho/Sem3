USE NorthwindDW

BULK INSERT shippersdim
--				^ not case sensitive
FROM 'D:\SP SEM 3\ST1501 - DATA ENGINEERING\Topic E\shippers.txt'
WITH (fieldterminator='\t', rowterminator='\n')

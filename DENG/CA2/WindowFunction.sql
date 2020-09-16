SELECT 
	offices.*,
	CAST(ROUND(AVG(offices.AverageSales) OVER (), 2) AS NUMERIC(10,2)) OverallOfficesAverageSales,
	offices.AverageSales - CAST(ROUND(AVG(offices.AverageSales) OVER (), 2) AS NUMERIC(10,2)) SalesDiff
FROM
	(SELECT 
		sf.officeCode,
		CAST(ROUND(AVG(sf.unitPrice * sf.quantity), 2) AS NUMERIC(10,2)) AverageSales
	FROM 
		SalesFact sf
		INNER JOIN timeDIM t ON t.timeKey = sf.timeKey	
	WHERE 
		t.Year = '2004'
	GROUP BY officeCode) offices
ORDER BY offices.AverageSales DESC;
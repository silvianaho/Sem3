USE NorthWindDW

DECLARE @Employee VARCHAR(MAX)

SELECT @Employee =
	BulkColumn 
		FROM OPENROWSET(BULK 'D:\SP SEM 3\ST1501 - DATA ENGINEERING\Topic E\EmployeesData.json', SINGLE_BLOB) JSON

INSERT INTO EmployeeDIM
	SELECT * FROM OpenJSON(@Employee, '$')
		WITH(
		EmployeeKey INT '$.EmployeeKey',
		LastName VARCHAR(20) '$.LastName',
		FirstName VARCHAR(10) '$.FirstName',
		Title VARCHAR(30) '$.Title',
		TitleOfCourtesy VARCHAR(25) '$.TitleOfCourtesy',
		BirthDate VARCHAR(50) '$.BirthDate',
		HireDate VARCHAR(50) '$.HireDate',
		[Address] VARCHAR(60) '$.Address',
		Country VARCHAR(15) '$.Country',
		HomePhone VARCHAR(24) '$.HomePhone',
		Extension VARCHAR(4) '$.Extension',
		Notes VARCHAR(255) '$.Notes',
		ReportsTo INT '$.ReportsTo')


---***********************************************************************************************

 -- Not Tuned Query 
 -- Workload Duration = 3432
 -- Exacution Plan Query Cost = 89%

---***********************************************************************************************

	Set Statistics Time on
	-- varchar to Nvarchar
	Select p.FirstName , p.LastName,p.BusinessEntityID,
	c.AccountNumber, c.CustomerID
	from Sales.Customer AS c 
	Inner Join  Person.Person AS p  On c.PersonID = p.BusinessEntityID	
	Where AccountNumber like N'AW00026330'



---***********************************************************************************************

 -- Tuned Query 
 -- Workload Duration = 4
 -- Exacution Plan Query Cost = 11%

 ---***********************************************************************************************

	Set Statistics Time on
	-- varchar to Nvarchar
	-- Explict Conversion Performance
	Select p.FirstName , p.LastName,p.BusinessEntityID,
	c.AccountNumber, c.CustomerID
	from Sales.Customer AS c 
	Inner Join  Person.Person AS p  On c.PersonID = p.BusinessEntityID	
	Where AccountNumber = convert(varchar,N'AW00026330')



---***********************************************************************************************

---		Tuning Advisor Result
---		Estimation Improvement: 27%

---***********************************************************************************************

	--Profiler Suggestion -------

	--Suggestion 1-------
	CREATE NONCLUSTERED INDEX [_dta_index_Customer_9_1653580929__K1] ON [Sales].[Customer]
	(
		[CustomerID] ASC
	)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]


	--Suggestion 2-------
	SET ANSI_PADDING ON

	CREATE NONCLUSTERED INDEX [_dta_index_Customer_9_1653580929__K5_K1_K2] ON [Sales].[Customer]
	(
		[AccountNumber] ASC,
		[CustomerID] ASC,
		[PersonID] ASC
	)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]

	--Suggestion 3-------
	SET ARITHABORT ON
	SET CONCAT_NULL_YIELDS_NULL ON
	SET QUOTED_IDENTIFIER ON
	SET ANSI_NULLS ON
	SET ANSI_PADDING ON
	SET ANSI_WARNINGS ON
	SET NUMERIC_ROUNDABORT OFF
	CREATE STATISTICS [_dta_stat_1653580929_1_2_5] ON [Sales].[Customer]([CustomerID], [PersonID], [AccountNumber])





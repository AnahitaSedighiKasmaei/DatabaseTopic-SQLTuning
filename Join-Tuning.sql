 
---***********************************************************************************************
 -- Not Tuned Query =
 -- Workload Duration = 125
 -- Query Cost = 50%
---***********************************************************************************************

	select  pp.FirstName,pp.LastName, pp.BusinessEntityID
	from person.Person pp,Person.PersonPhone ppp,Person.Password ppa
	where pp.BusinessEntityID=ppp.BusinessEntityID and
	ppa.BusinessEntityID = pp.BusinessEntityID and 
	pp.BusinessEntityID= ppa.BusinessEntityID
	and  pp.BusinessEntityID > 1000

 
---***********************************************************************************************
 -- Tuned Query 
 -- Workload Duration = 115
 -- Query Cost = 50%
---***********************************************************************************************

	select pp.FirstName,pp.LastName , pp.BusinessEntityID
	from person.Person pp 
	inner join Person.PersonPhone ppp on pp.BusinessEntityID= ppp.BusinessEntityID AND pp.BusinessEntityID > 1000
	inner join Person.Password ppa on pp.BusinessEntityID= ppa.BusinessEntityID
  
  
---***********************************************************************************************
---		Tuning Advisor Result
---		Estimation Improvement: 16%

---***********************************************************************************************
	--Profiler Suggestion -------
		CREATE NONCLUSTERED INDEX [_dta_index_Password_9_226099846__K1] ON [Person].[Password]
		(
		[BusinessEntityID] ASC
		)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]

---***********************************************************************************************


 


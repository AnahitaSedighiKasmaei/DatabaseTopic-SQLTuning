
---***********************************************************************************************

 -- Not Tuned Query 
 -- Workload Duration = 139
 -- Exacution Plan Query Cost = 65%

---***********************************************************************************************

	select * from Production.Product p
	where p.[Name]  like 'Chai%'
	Union 
	select * from Production.Product p
	where p.ListPrice>0


---***********************************************************************************************

 -- Tuned Query 
 -- Workload Duration = 84
 -- Exacution Plan Query Cost = 65%

---***********************************************************************************************
	select * from Production.Product p
	where p.[Name]  like 'Chai%'
	Union All
	select * from Production.Product p
	where p.ListPrice>0


---***********************************************************************************************
---		Tuning Advisor Result
---		Estimation Improvement: 24%

---***********************************************************************************************

 -- 8 suggestions

---	The UNION operator eliminates the duplicate rows from the result set.
---	UNION ALL operator perform better performance than UNION operator
--- If we don’t consider the duplicate rows in the result set, we should use UNION ALL operator in our select statements


---***********************************************************************************************

 -- Not Tuned Query 
 -- Workload Duration = 66
 -- Exacution Plan Query Cost = 50%

---***********************************************************************************************

	select ppsc.ProductSubcategoryID,pp.Name,ppc.Name as ProductCategoryName,pp.StandardCost,pp.Color
	from Production.Product pp
	inner join Production.ProductSubcategory ppsc on ppsc.ProductSubcategoryID = pp.ProductSubcategoryID
	inner join Production.ProductCategory ppc on ppc.ProductCategoryID= ppsc.ProductCategoryID
	group by ppsc.ProductSubcategoryID,pp.Name,ppc.Name,pp.StandardCost,pp.Color
	having pp.StandardCost>0 AND
	pp.Color is not null AND
	COUNT(ppsc.ProductSubcategoryID)>0




---***********************************************************************************************
 -- Not Tuned Query 
 -- Workload Duration =47
 -- Exacution Plan Query Cost = 50%

---***********************************************************************************************
	select ppsc.ProductSubcategoryID,pp.Name,ppc.Name as ProductCategoryName,pp.StandardCost
	from Production.Product pp
	inner join Production.ProductSubcategory ppsc on ppsc.ProductSubcategoryID = pp.ProductSubcategoryID and  pp.StandardCost>0 and pp.Color is not null
	inner join Production.ProductCategory ppc on ppc.ProductCategoryID= ppsc.ProductCategoryID
	group by ppsc.ProductSubcategoryID,pp.Name,ppc.Name,pp.StandardCost,pp.Color
	having COUNT(ppsc.ProductSubcategoryID)>0



---***********************************************************************************************
---		Tuning Advisor Result
---		Estimation Improvement: 40%

---***********************************************************************************************

	CREATE NONCLUSTERED INDEX [_dta_index_Product_9_482100758__K19_K9_2_6] ON [Production].[Product]
	(
		[ProductSubcategoryID] ASC,
		[StandardCost] ASC
	)
	INCLUDE([Name],[Color]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]




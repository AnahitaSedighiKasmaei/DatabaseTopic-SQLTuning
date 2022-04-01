 
---***********************************************************************************************
 -- Not Tuned Query 
 -- Workload Duration = 41
 -- Exacution Plan Query Cost = 64%
---***********************************************************************************************
 
	 select * from  Production.Product p
	where SUBSTRING(p.[Name],1,4) = 'Chai'


---***********************************************************************************************
 -- Tuned Query 
 --  Workload Duration = 57
 --  Exacution Plan Query Cost = 36%
---***********************************************************************************************

	select * from Production.Product p
	where p.[Name]  like 'Chai%'


---***********************************************************************************************
---		Tuning Advisor Result
---		Estimation Improvement: 19%

---***********************************************************************************************

--Profiler Suggestion -------

--Suggestion 1-------
SET ANSI_PADDING ON

CREATE NONCLUSTERED INDEX [_dta_index_Product_9_482100758__K2_K1_3_4_5_6_7_8_9_10_11_12_13_14_15_16_17_18_19_20_21_22_23_24_25] ON [Production].[Product]
(
	[Name] ASC,
	[ProductID] ASC
)
INCLUDE([ProductNumber],[MakeFlag],[FinishedGoodsFlag],[Color],[SafetyStockLevel],[ReorderPoint],[StandardCost],[ListPrice],[Size],[SizeUnitMeasureCode],[WeightUnitMeasureCode],[Weight],[DaysToManufacture],[ProductLine],[Class],[Style],[ProductSubcategoryID],[ProductModelID],[SellStartDate],[SellEndDate],[DiscontinuedDate],[rowguid],[ModifiedDate]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]

---***********************************************************************************************

--  Scalar-valued functions are executed for each row of the result set
--  The index scan operator reads all index pages in order to find the proper records.
--  They can damage the query performance when trying to use for the queries which will return a huge number of rows
--  As possible, we should avoid the index scan operator when we see it in our execution plans.



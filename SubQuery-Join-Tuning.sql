
---***********************************************************************************************
 -- Not Tuned Query 
 -- Workload Duration = 203
 -- Exacution Plan Query Cost = 65%
---***********************************************************************************************
 Select 
(Select psp.StateProvinceCode from Person.StateProvince psp 
where pa.StateProvinceID= psp.StateProvinceID) as StateProvinceCode,
(Select psp.Name from Person.StateProvince psp 
where pa.StateProvinceID= psp.StateProvinceID) as StateProvinceName,
(Select psp.StateProvinceCode from Person.StateProvince psp 
where pa.StateProvinceID= psp.StateProvinceID) as StateProvinceCode,
pa.PostalCode,pa.City from  Person.Address pa



 ---***********************************************************************************************
 -- Tuned Query 
 -- Workload Duration = 158
 -- Exacution Plan Query Cost = 35%
---***********************************************************************************************


select psp.StateProvinceCode,psp.Name as StateProvinceName, pa.PostalCode,pa.City from Person.Address pa
inner join Person.StateProvince psp
on pa.StateProvinceID= psp.StateProvinceID

---***********************************************************************************************
---		Tuning Advisor Result
---		Estimation Improvement: 56%
---***********************************************************************************************

--Profiler Suggestion -------

CREATE NONCLUSTERED INDEX [_dta_index_Address_9_1029578706__K5_4_6] ON [Person].[Address]
(
	[StateProvinceID] ASC
)
INCLUDE([City],[PostalCode]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]

---***********************************************************************************************

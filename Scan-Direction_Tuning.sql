
---***********************************************************************************************
 -- Not Tuned Query 
 -- Workload Duration = 103
 -- Execution Plan Query Cost = 55%
---***********************************************************************************************


	select * from Person.Person
	Where LastName Like '%Sanchez'

-- Its scans rather than seeking ,its non sargable query

---***********************************************************************************************
 -- Not Tuned Query 
 -- Workload Duration = 87
 -- Execution Plan Query Cost = 45%
---***********************************************************************************************

	select * from Person.Person
	Where LastName Like 'Sanchez%'

-- seek instead of scan because index will scan from left most of the table

---***********************************************************************************************
---		Tuning Advisor Result
---		Estimation Improvement: 34%

---***********************************************************************************************

--Profiler Suggestion -------

--Suggestion1 -------
	SET ANSI_PADDING ON

	CREATE NONCLUSTERED INDEX [_dta_index_Person_9_274100017__K7] ON [Person].[Person]
	(
		[LastName] ASC
	)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]


--Suggestion2 -------
	SET ANSI_PADDING ON

	CREATE NONCLUSTERED INDEX [_dta_index_Person_9_274100017__K7_K1_2_3_4_5_6_8_9_10_11_12_13] ON [Person].[Person]
	(
		[LastName] ASC,
		[BusinessEntityID] ASC
	)
	INCLUDE([PersonType],[NameStyle],[Title],[FirstName],[MiddleName],[Suffix],[EmailPromotion],[AdditionalContactInfo],[Demographics],[rowguid],[ModifiedDate]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]


# DatabaseTopic-SQLTuning

Note: These query tunning have been done base on "AdventureWorks2019" Database.

SQL tuning project for Advance Database Topic
SQL Server performance tuning contains a set of processes and procedures designed to optimize relational database queries to run as efficiently as possible. SQL tuning applies several elements, including identifying which queries are encountering slowdowns and optimizing them for maximum efficiency. As a result, numerous relational databases such as MySQL and SQL Server will benefit from SQL tuning.
Using proper indexes based on the table size and selecting appropriate fields as indexes has a significant impact on performance.



![image](https://user-images.githubusercontent.com/69750288/161780888-bb66a87e-7bbf-4c6d-afe8-bc5fbd65f4f5.png)


Workflow steps:
1.	Write a query
2.	Apply tunning principals
3.	Check the Execution plan
4.	Create a workload in SQL-Profiler
5.	Save the Workload as a trace-File 
6.	Crease a Session in Tunning-Advisor and assign the saved Trace file to it
7.	Run the Analysing section
8.	Check suggested Tunning advisers and apply them to the database 

---------------------------------------------
To discover the performance issue SQL tunning can be started by these steps:
1.	Know your tables and row counts
2.	 Examine the query filters, WHERE, and JOIN clauses and note the filtered row count
3.	Know the selectivity of your tables: how many rows you’ll be working with, or the size of the actual, logical set
4.	Check primary tunning principles
5.	Knowing and using constraints can help
6.	Check indexes on the Table: To get information about your indexes, run the sp_helpindex stored procedure
7.	Examine the actual execution plan (not the estimated plan): Estimated plans use estimated statistics to determine the estimated rows; actual plans use actual statistics at runtime. If the actual and estimated plans are different, you may need to investigate further.
8.	Record your results, focusing on the number of logical I/Os: If you don’t record the results, you won’t be able to determine the true impact of your changes.
9.	Adjust the query based on your findings and make small, single changes at a time.
10.	Making too many changes at one time can be ineffective as they can cancel each other out
11.	Re-run the query and record results from the change you made
12.	 If you still need more improvement, consider adjusting the indexes to reduce logical I/O
13.	Rerun the query and record results

![Index-SQL-tuning](https://user-images.githubusercontent.com/69750288/167996905-5b649006-7250-4fed-b0d4-7ad68900bff3.png)



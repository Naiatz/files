-- נושא PIVOT שיעור 18.11

SELECT * 
FROM (SELECT  [OrderID]
      ,year([OrderDate]) yy
	  ,month([OrderDate]) mm
  FROM [Northwind].[dbo].[Orders])O
  pivot(COUNT([OrderID]) for YY in ([1996],[1997],[1998])) PVT

  select *
  FROM(select
		e.employeeID as EMPID,
		m.lastname as managername
  FROM employees e join employees m
  on e.ReportsTo = m.employeeid) e
  pivot(COUNT([EMPID]) for managername in ([Fuller],[Buchanan])) as PVT


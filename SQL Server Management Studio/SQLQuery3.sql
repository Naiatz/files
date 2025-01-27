-- תרגיל כיתה 2
SELECT TOP (1000) e1.[EmployeeID]
      ,e1.[LastName]
      ,e1.[FirstName]
      ,e1.[Title]
      ,e1.[TitleOfCourtesy]
      ,e1.[BirthDate]
      ,e1.[HireDate]
      ,e1.[Address]
      ,e1.[City]
      ,e1.[Region]
      ,e1.[PostalCode]
      ,e1.[Country]
      ,e1.[HomePhone]
      ,e1.[Extension]
      ,e1.[Photo]
      ,e1.[Notes]
      ,e1.[ReportsTo]
      ,e1.[PhotoPath]
  --FROM Employees e1
  --where  exists (select *
		--			from Employees e2
		--			where e1.EmployeeID=e2.ReportsTo)

FROM Employees e1
  where  e1.EmployeeID in (select e2.ReportsTo
						from Employees e2)
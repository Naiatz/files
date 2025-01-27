-- מטלת כיתה 1 14.11

SELECT TOP (1000) c.CustomerID
      ,c.CompanyName
      ,c.ContactName
      ,c.ContactTitle
      ,c.Address
      ,c.City
      ,c.Region
      ,c.PostalCode
      ,c.Country
      ,c.Phone
      ,c.Fax
	  ,row_number() over(partition by c.country order by c.customerID) as "row number"
  FROM Customers c

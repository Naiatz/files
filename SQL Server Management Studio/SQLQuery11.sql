-- תרגיל ממסמך 2

SELECT c.[CustomerID]
      ,c.[CompanyName]
      ,o.OrderID
	  ,o.OrderDate
	  ,e.EmployeeID
	  ,e.FirstName +' '+ e.LastName "full nsme"
	  ,p.ProductID
	  ,p.ProductName
	  ,p.UnitPrice
	  ,p.UnitsOnOrder
  FROM Customers c  
	left join Orders o 
		on c.CustomerID = o.CustomerID
	left join Employees e 
		on e.EmployeeID = o.EmployeeID
	left join [Order Details] od
		on o.orderID = od.orderID
	left join Products p
		on p.ProductID = od.ProductID
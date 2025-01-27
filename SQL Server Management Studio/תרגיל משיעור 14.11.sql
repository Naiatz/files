-- תרגיל כיתה 3 14.11


with tbl1
as
(SELECT o.[OrderID]
      ,o.[CustomerID]
      ,o.[OrderDate]
	  ,lag(o.orderdate,1,o.orderdate) over(PARTITION BY o.customerID order by o.orderdate) as "date_last_order"
  FROM Orders o),
TBL2
AS(select *
	,datediff(day,tbl1.date_last_order,tbl1.OrderDate) as "days_between"
	from tbl1)
SELECT *
	,AVG(TBL2.days_between)OVER(PARTITION BY TBL2.customerID) as "avg_day"
	FROM TBL2
	


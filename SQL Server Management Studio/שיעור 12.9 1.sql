-- שיעור 12.9
--תרגיל 1 

-- כתבו תוכנית המקבלת מספר הזמנה ומחזירה את שמות המוצרים בהזמנה
--, עלות כל מוצר וגם את סכום מחירי המוצרים בהזמנה

CREATE PROCEDURE get_order 
@OrderID int
as
select o.orderID
	,p.productID
	,p.productname
	,o.unitprice
	,o.quantity
	,o.discount
	,o.unitprice*o.quantity*(1-o.discount) as "total line"
	from [order details] o join product p
	on o.productid=p.productid
	where od.orderID=@OrderID
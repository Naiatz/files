--מטבלת לקוחות הציגו עבור כל מדינה את רשימת הרים שלה מופרדים על ידי פסיקים

SELECT distinct[Country] 
		,stuff((select ','+City
		FROM Customers i
		where o.Country=i.Country
		 for xml path ('')),1,1,'')
	from Customers o

-- עבור כל הזמנה רשום בשורה את כל המוצרים המוזמנים

select o.orderid	','+p.productname
from
on
for xml path
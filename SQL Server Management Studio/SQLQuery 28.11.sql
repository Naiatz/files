--����� ������ ����� ���� �� ����� �� ����� ���� ��� ������� �� ��� ������

SELECT distinct[Country] 
		,stuff((select ','+City
		FROM Customers i
		where o.Country=i.Country
		 for xml path ('')),1,1,'')
	from Customers o

-- ���� �� ����� ���� ����� �� �� ������� ��������

select o.orderid	','+p.productname
from
on
for xml path
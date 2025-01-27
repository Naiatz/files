-- ����� 12.9
--����� 1 

-- ���� ������ ������ ���� ����� ������� �� ���� ������� ������
--, ���� �� ���� ��� �� ���� ����� ������� ������

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
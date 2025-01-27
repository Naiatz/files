with T
as
(SELECT[QuantityPerUnit]
	  --����� ����� �����
	  ,patindex('%[0-9]%',[QuantityPerUnit]) "start_position"
	  --����� ���� ����� ��� ����
	  ,patindex('%[0-9]_[A-Z]%',[QuantityPerUnit]) "end_position"
  FROM Products
)

select [QuantityPerUnit]
	,substring([QuantityPerUnit],start_position,end_position)
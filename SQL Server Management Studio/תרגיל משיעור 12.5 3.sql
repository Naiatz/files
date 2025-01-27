--תרגיל כיתה ב 5.12 
-- תרגיל 4
-- הריצו בעזרת לוולאה את פרטי הלקוחות: קוד, מדינה וטלפון
create view v_cust
as
select ROW_NUMBER()over(order by customerid) as RWN
,*
from Customers

Declare
	@RWN INT,
	@customerID NCHAR(5),
	@country NVARCHAR(15),
	@phone NVARCHAR(24),
	@counter INT
	
	set @RWN=1
	SET @COUNTER=(select count(*) from Customers)
WHILE @RWN<=@counter
begin
	SELECT 
		  @customerID=CustomerID
		  ,@country=Country
		  ,@phone=Phone
	  FROM v_cust
	  where RWN=@RWN


	Print concat_ws(' ','the customerID is',@customerID,' ',
						'his country is',@country,' ',
						'his phone is',@phone,' ')

	set @RWN=@RWN+1
END


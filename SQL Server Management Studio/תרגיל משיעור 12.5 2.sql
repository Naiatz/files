--תרגיל כיתה ב 5.12 
-- תרגיל 3
-- צור לולאה אשר תבצע את ההודעה עבור כל העובדים
Declare
	@EmployeeID INT=1,
	@LastName VARCHAR(25),
	@BirthDate DATE,
	@Tenure INT,
	@managerID INT,
	@Manager VARCHAR(25),
	@counter INT

	SET @COUNTER=(select count(*) from Employees)
WHILE @EmployeeID<=@counter
begin
SELECT 
      @LastName=e1.LastName
      ,@BirthDate=e1.BirthDate
      ,@Tenure=DATEDIFF(yy,e1.hiredate,getDATE())
   ,@Manager=e2.LastName
  FROM Employees e1 join Employees e2
 on e1.reportsto=e2.EmployeeID
  where e1.EmployeeID=@EmployeeID

  --select @manager=lastname
  --from Employees m 
  --where m.reportsto=@EmployeeID


    Print concat_ws(' ','the ID is',@EmployeeID,' ',
					'his last name is',@LastName,' ',
					'his birthdate is',@BirthDate,' ',
					'his tenure is',@Tenure,' ',
					'his manager is',@Manager,' ')

	if @Tenure>=31
		print ('YOU ARE FIRED')
	ELSE
		print ('KEEP WORKING')

		set @EmployeeID=@EmployeeID+1
	END

--תרגיל כיתה ב 5.12 
--תרגיל 1
-- כתבו תכנית במקבלת מספר עובד ומחזירה לחלונית ההודעות את המידע הבא: קוד עובד, שם משפחה, תאריך לידה, וותק בשנים, שם מנהל העובד
Declare
	@EmployeeID INT=1,
	@LastName VARCHAR(25),
	@BirthDate DATE,
	@Tenure INT,
	@managerID INT,
	@Manager VARCHAR(25),
	@counter INT=1

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

-- תרגיל 2
--הוסיפו לבלוק את התנאי 
-- אם הוותק של העובד מעל 31 יש להוציא פלט YOURE ARE FIRED
--אחרת KEEP WORKING
	if @Tenure>=31
		print ('YOU ARE FIRED')
	ELSE
		print ('KEEP WORKING')

-- תרגיל 3
-- צור לולאה אשר תבצע את ההודעה עבור כל העובדים

WHILE @counter<=9
Begin
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
		set @counter=@counter+1
	END
--����� ���� � 5.12 
--����� 1
-- ���� ����� ������ ���� ���� ������� ������� ������� �� ����� ���: ��� ����, �� �����, ����� ����, ���� �����, �� ���� �����
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

-- ����� 2
--������ ����� �� ����� 
-- �� ����� �� ����� ��� 31 �� ������ ��� YOURE ARE FIRED
--���� KEEP WORKING
	if @Tenure>=31
		print ('YOU ARE FIRED')
	ELSE
		print ('KEEP WORKING')

-- ����� 3
-- ��� ����� ��� ���� �� ������ ���� �� �������

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
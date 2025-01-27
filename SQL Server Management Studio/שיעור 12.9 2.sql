-- ����� 12.9
--����� 2 

--���� 1. ���� �������� ������ �� ���� ����� ������� �� ��� ���� �����
-- ���� 2. ����� �� ��������� ���� ������ 1� 4
--���� 3. ����� �� ��������� ������� ����� �� �� ������� ����� �������

CREATE PROCEDURE get_employee_name 
@EmployeeID int
as
	select e.EmployeeID
		,e.FirstName +' '+e.LastName as "Full_Name"
		,DATEDIFF(yy,e.birthDate,getDATE()) as "AGE"
	from Employees e
	where e.EmployeeID=@EmployeeID


		execute get_employee_name 1
		execute get_employee_name 4

declare
	@EmployeeID int

	set @EmployeeID=1

	while @EmployeeID <=(select count(*) from Employees)
	begin

		exac get get_employee_name @EmployeeID
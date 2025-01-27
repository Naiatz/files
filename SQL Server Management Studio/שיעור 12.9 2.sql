-- שיעור 12.9
--תרגיל 2 

--סעיף 1. כתבו פרוצדורה המקבלת את מספר העובד ומחזירה את שמו המלא והגיל
-- סעיף 2. הריצו את הפרוצדורה עבור עובדים 1ו 4
--סעיף 3. הריצו את הפרוצדורה באמצעות לולאה על כל העובדים בטבלת העובדים

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
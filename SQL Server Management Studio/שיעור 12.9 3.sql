CREATE PROCEDURE get_emp
	 @employeeid INT --INPUT
	,@fullname VARCHAR(40)OUTPUT
	,@seniority INT OUTPUT
	,@status VARCHAR(50) OUTPUT
AS

SELECT @fullname=lastname+' '+firstname,@seniority=DATEDIFF(YY, HireDate,GETDATE())
FROM employees
WHERE employeeid = @employeeid
IF @seniority >31
	SET @status ='Go Home'
ELSE 
	SET @status ='KEEP WORKING'

Declare
	@v_fullname VARCHAR(40) 
	,@v_seniority INT 
	,@v_status VARCHAR(50) 
execute get_emp 1,@v_fullname OUTPUT,@v_seniority OUTPUT,@v_status OUTPUT
print(concat( @v_seniority ,@v_status))
 
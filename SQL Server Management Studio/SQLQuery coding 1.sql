DECLARE	
	@COURSE_START date
	,@number_days int 
	SET @COURSE_START = '2024-09-23'
	SET @number_days = DATEDIFF(dd, @COURSE_START, GETDATE())	
	PRINT (@number_days)

-- מטלת כיתה 2 14.11


WITH TBL1
AS	
(SELECT[ProductID]
      ,[ProductName]
      ,[CategoryID]
      ,[UnitPrice]
	  ,RANK() OVER(PARTITION BY [CategoryID] ORDER BY [UnitPrice]DESC) AS "RANK_NUM"
  FROM [Northwind].[dbo].[Products])
SELECT *
	  FROM TBL1
	  WHERE RANK_NUM = 1

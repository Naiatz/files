-- שאלה מהשיעור 11.11

--with tbl1
--as
--(SELECT p.ProductID
--      ,p.ProductName
--	  ,p.UnitPrice price
--	  ,p.UnitPrice*1.17 as after_VAT
--      ,p.CategoryID
--	  ,c.Categoryname
--  FROM Products p join Categories c
--  on c.CategoryID = p.CategoryID),
--  tbl2
--  as
--  (select 
--		tbl1.Categoryid
--		,avg(after_VAT) avg_price
--  from tbl1
--  group by Categoryid )
--	select *
--	from tbl1 join tbl2
--	on tbl1.Categoryid = tbl2.Categoryid 
--	--where tabl1.price > tbl2.avg_price

  with tbl3
  as
	  (SELECT p.ProductID
		  ,p.ProductName
		  ,p.UnitPrice price
		  ,p.UnitPrice*1.17 as after_VAT
		  ,p.CategoryID
		  ,c.Categoryname
		  ,cast(round(p.UnitPrice*1.17*1.17,2) as float ) afte_tax
		  ,avg(p.UnitPrice*1.17) over(partition by p.CategoryID) as avg_price_by_cat
	  FROM Products p join Categories c
	  on c.CategoryID = p.CategoryID)
  
  select *
  from tbl3
  where afte_tax > avg_price_by_cat

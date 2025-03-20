--תרגיל 1
AnnualLinearIncome AS (
    SELECT
        Year,
        IncomePerYear,
        NumberOfDistinctMonths,
        CASE 
            WHEN NumberOfDistinctMonths > 0 THEN (IncomePerYear / NumberOfDistinctMonths) * 12
            ELSE 0
        END AS LinearIncome
    FROM AnnualSales
),

GrowthRate AS (
    SELECT
        Year,
        IncomePerYear,
        NumberOfDistinctMonths,
        LinearIncome,
        LAG(LinearIncome) OVER (ORDER BY Year) AS PreviousLinearIncome,
        CASE 
            WHEN LAG(LinearIncome) OVER (ORDER BY Year) IS NOT NULL THEN
                ROUND((LinearIncome - LAG(LinearIncome) OVER (ORDER BY Year)) * 100.0 / LAG(LinearIncome) OVER (ORDER BY Year), 3)
            ELSE NULL
        END AS GrowthRate
    FROM AnnualLinearIncome
)

SELECT 
    Year AS Year,
    CAST(IncomePerYear AS DECIMAL(18, 2)) AS IncomePerYear,
    NumberOfDistinctMonths AS NumberOfDistinctMonths,
    CAST(LinearIncome AS DECIMAL(18, 2)) AS YearlyLinearIncome,
    CAST(GrowthRate AS DECIMAL(4, 2)) AS GrowthRate
FROM GrowthRate
ORDER BY Year;

-- תרגיל 2
WITH CustomerIncome AS (
    SELECT 
        YEAR(i.InvoiceDate) AS "TheYear",
        DATEPART(QUARTER, i.InvoiceDate) AS "TheQuarter",
        c.CustomerName,
        SUM(il.ExtendedPrice - il.TaxAmount) AS "IncomePerYear"
    FROM Sales.Invoices i
    JOIN Sales.InvoiceLines il ON i.InvoiceID = il.InvoiceID
    JOIN Sales.Customers c ON i.CustomerID = c.CustomerID
    GROUP BY 
        YEAR(i.InvoiceDate),
        DATEPART(QUARTER, i.InvoiceDate),
        c.CustomerName
),
RankedCustomers AS (
    SELECT 
        TheYear,
        TheQuarter,
        CustomerName,
        IncomePerYear,
        DENSE_RANK() OVER (
            PARTITION BY TheYear, TheQuarter 
            ORDER BY IncomePerYear DESC
        ) AS DNR
    FROM CustomerIncome
)
SELECT 
    TheYear,
    TheQuarter,
    CustomerName,
    IncomePerYear AS IncomePerYear,
    DNR
FROM RankedCustomers
WHERE DNR <= 5
ORDER BY 
    TheYear,
    TheQuarter,
    DNR

-- תרגיל 3
SELECT TOP 10
    si.StockItemID,
    si.StockItemName,
    SUM(il.ExtendedPrice - il.TaxAmount) as TotalProfit
FROM Sales.InvoiceLines il
JOIN Warehouse.StockItems si ON il.StockItemID = si.StockItemID
GROUP BY 
    si.StockItemID,
    si.StockItemName
ORDER BY 
    TotalProfit DESC

-- תרגיל 4

with t1 as 
(SELECT  si.StockItemID
      ,si.StockItemName
	  ,si.UnitPrice
	  ,si.RecommendedRetailPrice
	  ,(si.RecommendedRetailPrice-si.UnitPrice) as "NominalProductProfit"
  FROM warehouse.StockItems si
  )
  
  select
  row_number()over (ORDER BY NominalProductProfit desc) as RN,
  *
  ,dense_rank() over (ORDER BY NominalProductProfit desc) as DNR
  from t1
  order by NominalProductProfit desc

  --תרגיל 5
SELECT 
    CONCAT_WS(' - ',s.SupplierID,s.SupplierName) as "SupplierDetails",
    STRING_AGG(CONCAT(CAST(si.StockItemID as VARCHAR),' ',si.StockItemName),'/, ') AS "ProductDetails"
FROM Purchasing.Suppliers s
 JOIN Warehouse.StockItems si 
    ON s.SupplierID = si.SupplierID
GROUP BY 
    s.SupplierID,
    s.SupplierName
ORDER BY 
    s.SupplierName

-- תרגיל 6
 with t1 as(   
	SELECT 
        c.CustomerID,
		city.CityName,
		country.CountryName,
		country.Continent,
		country.region,
        SUM(il.ExtendedPrice) AS "TotalExtendedPrice"
    FROM Sales.Invoices i
    JOIN Sales.InvoiceLines il ON i.InvoiceID = il.InvoiceID
    JOIN Sales.Customers c ON i.CustomerID = c.CustomerID
	JOIN Application.Cities city on  city.CityID = c.DeliveryCityID
	JOIN Application.StateProvinces prov on prov.StateProvinceID = city.StateProvinceID
	JOIN Application.Countries country on country.CountryID = prov.CountryID
    GROUP BY 
        country.Continent,
		country.region,
		c.CustomerID,
		country.CountryName,
		city.CityName)
	select top 5 *
	from t1
	order by TotalExtendedPrice desc

-- תרגיל 7
WITH MonthlySales AS (
    SELECT 
        year(o.OrderDate) as "OrderYear",
        CAST(month(o.OrderDate) as VARCHAR(20)) as "OrderMonth",
        sum(ol.PickedQuantity*ol.UnitPrice) as "MonthlyTotal",
        sum(sum(ol.PickedQuantity*ol.UnitPrice))over(PARTITION by year(o.OrderDate) order by month(o.OrderDate), year(o.OrderDate)) as CulumativeTotal,
        month(o.OrderDate) as "SortOrder"
    FROM sales.Orders O
    JOIN sales.OrderLines OL on OL.OrderID = O.OrderID
    GROUP BY year(o.OrderDate), month(o.OrderDate)
)
SELECT OrderYear, OrderMonth, MonthlyTotal, CulumativeTotal
FROM (
    SELECT 
        OrderYear,
        OrderMonth,
        MonthlyTotal,
        CulumativeTotal,
        SortOrder
    FROM MonthlySales
    UNION ALL
    SELECT 
        OrderYear,
        'Grand Total' as "OrderMonth",
        sum(MonthlyTotal) as "MonthlyTotal",
        sum(MonthlyTotal) as "CulumativeTotal",
        13 as SortOrder
    FROM MonthlySales
    GROUP BY OrderYear
) AS SortedData
ORDER BY OrderYear, SortOrder

-- תרגיל 8
WITH Monthlyorders AS (
    SELECT 
        year(o.OrderDate) as "OrderYear",
        month(o.OrderDate) as "OrderMonth",
		count (o.OrderID) as "numberoforders"
    FROM sales.Orders O
    GROUP BY year(o.OrderDate), month(o.OrderDate)
)
SELECT 
    OrderMonth,
    ISNULL([2013], 0) as '2013',
    ISNULL([2014], 0) as '2014',
    ISNULL([2015], 0) as '2015',
    ISNULL([2016], 0) as '2016'
FROM MonthlyOrders
PIVOT (
    SUM(NumberOfOrders) 
    FOR OrderYear IN ([2013], [2014], [2015], [2016])
) as PVT
ORDER BY OrderMonth

-- תרגיל 9
with t1 as 
(SELECT 
	C.CustomerID as CustomerID,
	c.CustomerName as CustomerName,
	o.OrderDate as OrderDate,
	lag(o.OrderDate) OVER (partition by c.CustomerId order by o.OrderDate)as "previousOrderDate",
	CAST('2016-05-31' AS DATE) AS wastoday
	from sales.Customers c
	join sales.Orders o on o.CustomerID = c.CustomerID
	),
t2 as (
		select
		*,
		DATEDIFF(day,OrderDate,wastoday) as "WildDaysSinceLastOrder",
		DATEDIFF(day,previousOrderDate,OrderDate) as "WildAvg"
		from t1
		),
t3 as (
select
		CustomerID,
		CustomerName,
		OrderDate,
		previousOrderDate,
		MIN(WildDaysSinceLastOrder)over (Partition by CustomerID) as "DaysSinceLastOrder",
		avg(WildAvg)over (Partition by CustomerID) as "AvgDaysBetweenOrders"
		from t2
		)

select  
*,
case 
	when DaysSinceLastOrder <= (2*AvgDaysBetweenOrders)
		then 'Active'
	else 
		'potential Churn'
	end as CustomerStatus
from t3
--תרגיל 10
with distCust as
	(SELECT distinct cc.CustomerCategoryName,
		case
			when c.CustomerName like 'Tailspin%' then 'Tailsping'
			when c.CustomerName like 'Wingtip%' then 'Wingtip'
			else c.CustomerName
		end as "CustomerName"
	FROM Sales.Customers c join Sales.CustomerCategories cc 
	on c.CustomerCategoryID = cc.CustomerCategoryID
	group by cc.CustomerCategoryName,CustomerName
	),

totalCustomers as 
	(SELECT COUNT(DISTINCT CustomerName) as TotalCust
	    FROM distCust
	 )

select
	CustomerCategoryName,
	count(CustomerName) as "CustomzerCOUNT",
	(SELECT TotalCust FROM totalCustomers) as "TotalCustomers",
	 CONCAT(
        CAST(ROUND(CAST(COUNT(CustomerName) AS FLOAT) / 
            (SELECT CAST(TotalCust AS FLOAT) FROM totalCustomers) * 100, 2) AS DECIMAL(5,2)),
        '%') as "Percentage"
	from distCust
	group by CustomerCategoryName
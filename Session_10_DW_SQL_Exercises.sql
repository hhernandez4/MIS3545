use AdventureWorksDW2012;

/*Employees whose birthday is in Feburary*/
SELECT *
FROM DimEmployee
WHERE MONTH(BirthDate) = 2

/*who are the Sales Representatives whose birthday is in Feburary?*/
SELECT *
FROM DimEmployee
WHERE MONTH(BirthDate) = 2
and Title = 'Sales Representative';

/*List all the sales processed by these Sales Representatives */

SELECT e.FirstName, e.LastName, s.*
FROM DimEmployee as e join FactResellerSales as s on e.EmployeeKey = s.EmployeeKey
WHERE MONTH(e.BirthDate) = 2
and Title = 'Sales Representative'

/*who is a better sales representative that was born in Feburary?*/
SELECT e.FirstName, e.LastName, COUNT(s.SalesORderNumber) as Count_Of_Orders, SUM(s.SalesAmount) as Sum_Of_Orders
FROM DimEmployee as e join FactResellerSales as s on e.EmployeeKey = s.EmployeeKey
WHERE MONTH(e.BirthDate) = 2
and Title = 'Sales Representative'
GROUP BY e.FirstName, e.LastName
ORDER BY Sum_Of_Orders;

/*total Amount of off-line sales in Massachusetts*/
SELECT COUNT(s.SalesOrderNumber) as Total_Amt_Sales
FROM FactResellerSales as s full join DimSalesTerritory as t on s.SalesTerritoryKey = t.SalesTerritoryKey full join DimGeography as g on t.SalesTerritoryKey = g.SalesTerritoryKey
WHERE g.StateProvinceName = 'Massachusetts';

/*Total Amount of Internet Sales in 1st quarter each year in each country*/
SELECT SalesTerritoryCountry, COUNT(SalesOrderLineNumber) as Total_Amt_Sales
FROM FactInternetSales as i full join DimSalesTerritory as t on i.SalesTerritoryKey = t.SalesTerritoryKey full join DimGeography as g on t.SalesTerritoryKey = g.SalesTerritoryKey
WHERE MONTH(i.OrderDate) = 1 or MONTH(i.OrderDate) = 2 or MONTH(i.OrderDate) = 3 or MONTH(i.OrderDate) = 4
GROUP BY SalesTerritoryCountry

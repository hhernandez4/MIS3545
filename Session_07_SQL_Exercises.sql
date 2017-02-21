USE AdventureWorks2012; /*Set current database*/

/*1, Display the total amount collected from the orders for each order date. */
/* Table: Sales.SalesOrderHeader*/
SELECT OrderDate,
	SUM (TotalDue) as DateTotalDue
FROM Sales.SalesOrderHeader
GROUP BY OrderDate
ORDER BY OrderDate;

/*2, Display the total amount collected from selling the products, 774 and 777. */
/* Table: Sales.SalesOrderDetail*/

SELECT ProductID, SUM(LineTotal) as Total_Amount_Collected, MAX(UnitPrice) as MaxUnitPrice
FROM Sales.SalesOrderDetail
WHERE ProductID = 774 OR ProductID = 777
GROUP BY ProductID; 

/*3, Write a query to display the sales person BusinessEntityID, last name and first name of all the sales persons and the name of the territory to which they belong.*/
SELECT p.BusinessEntityID, p.LastName, p.FirstName, t.Name
FROM Person.Person as p inner join Sales.SalesPerson as s on p.BusinessEntityID = s.BusinessEntityID full outer join Sales.SalesTerritory as t on t.TerritoryID = s.TerritoryID 

/*4,  Write a query to display the Business Entities of the customers that have the 'Vista' credit card.*/
/* Tables: Sales.CreditCard, Sales.PersonCreditCard, Person.Person*/

SELECT p.BusinessEntityID
FROM Sales.CreditCard as c inner join Sales.PersonCreditCard as s on c.CreditCardID = s.CreditCardID join Person.Person as p on p.BusinessEntityID = s.BusinessEntityID
WHERE c.CardType = 'Vista'; 

/*Show the number of customers for each type of credit cards*/

SELECT CardType, COUNT(CreditCardID) as Number_of_Customers
FROM Sales.CreditCard
GROUP BY CardType;

/*5, Write a query to display ALL the country region codes along with their corresponding territory IDs*/
/* tables: Sales.SalesTerritory,  Person.CountryRegion*/

SELECT  p.CountryRegionCode, p.Name, s.TerritoryID
FROM Person.CountryRegion as p  left outer join Sales.SalesTerritory as s on s.CountryRegionCode = p.CountryRegionCode
WHERE s.TerritoryID is NULL

/*6, Find out the average of the total dues of all the orders.*/
/* tables: Sales.SalesOrderHeader*/

SELECT
	AVG(TotalDue) as Average_TotalDue
FROM Sales.SalesOrderHeader;

/*7, Write a query to report the sales order ID of those orders where the total due is greater than the average of the total dues of all the orders*/
/*Subquery*/
SELECT SalesOrderID
FROM Sales.SalesOrderHeader
/*WHERE TotalDue > 3915.9951 */
WHERE TotalDue >
	(SELECT AVG(TotalDue) as Average_TotalDue
FROM Sales.SalesOrderHeader)
ORDER BY TotalDue; 
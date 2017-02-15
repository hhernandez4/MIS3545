use AdventureWorks2012;

/*Find out all the customers from Sales.Customer table.*/
SELECT *
FROM Sales.Customer;


/*Find out all the sales orders from Sales.SalesOrderHeader table.*/
SELECT *
FROM Sales.SalesOrderDetail;



/*Find out sales details about productID 843*/
SELECT *
FROM Sales.SalesOrderDetail
/*WHERE ProductID = 843 OR ProductID = 844 OR ProductID = 845;*/
/*WHERE ProductID Between 843 and 845;*/
WHERE ProductID in(843,844, 845);


/*Sales info of all the products of which unit price is between 100 and 200*/
SELECT *
FROM Sales.SalesOrderDetail
WHERE UnitPrice between 100 and 200;
/*WHERE UnitPrice <=200 oR UnitPrice >=100;* YOU WOULD GET ALL*/ 

/*All the store names*/
SELECT Name
FROM Sales.Store;


/*Find out store names that contain "Bike" */
Select Name
FROM Sales.Store
WHERE Name like '%Bike%';
/*The % is like the * in Access that uses all the other stuff
This kind of query is not cap sensitive, if you want it to be cap sensitive
	COLLATE SQL_Latin1_General_CP1_CS_AS
	By using COLLATE is a coding system provided by SQL that will make it case sensitive*/



/*info of all the credit cards*/
SELECT *
FROM Sales.CreditCard;

/* A list of credit card types*/

SELECT distinct CardType
FROM Sales.CreditCard;

/*OR 
SELECT CardType
FROM Sales.CreditCard
GROUP BY CardType; */



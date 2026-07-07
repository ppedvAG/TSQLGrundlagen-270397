--Views = Sichten

/* 
Sichten bestehen aus einer! Abfrage

Sichten enthalten keine Daten!!!
Verhalten sich wie Tabellen: SELECT , JOIN, INS , UP , DEL

komplexe Statements vereinfachen
Aber auch wg Security. Sie können eig Rechte haben

*/
select * from (select ...) t


CREATE or alter VIEW vVerkauf
as
SELECT Customers.CustomerID, Customers.CompanyName, Customers.ContactName, Customers.ContactTitle, Customers.City, Customers.Country, Orders.EmployeeID, Orders.OrderDate, Orders.Freight, Orders.ShipCity, Orders.ShipCountry, [Order Details].UnitPrice, [Order Details].Quantity, [Order Details].OrderID, 
          [Order Details].ProductID, Employees.LastName, Employees.FirstName, Products.ProductName, Products.UnitsInStock
    , ( [Order Details].UnitPrice*[Order Details].Quantity)  as Possumme
    FROM   Customers INNER JOIN
          Orders ON Customers.CustomerID = Orders.CustomerID INNER JOIN
          Employees ON Orders.EmployeeID = Employees.EmployeeID INNER JOIN
          [Order Details] ON Orders.OrderID = [Order Details].OrderID INNER JOIN
          Products ON [Order Details].ProductID = Products.ProductID
GO

  Select * from vVerkauf


 select * from vVerkauf

 --Gib alle Länder der Kunden aus...
 
 select distinct country from vVerkauf  --warum 2155 Zeilen, wo  in Customers nur 91 Kunden drin sind
select distinct country from customers


select companyname, productname from vverkauf


---Eine Sicht kann auch geändert werden

CREATE VIEW vxy
as
select 

ALTER VIEW vxy
as
select..


CREATE OR ALTER VIEW vxy
as 
select 



--Löschen der Sicht

DROP VIEW vxy
					 USE NORTHWIND;
GO --kein TSQL Befehl... ist eine Anweisung für den Editor

--Variablen enden mit dem GO
--Der Batch endet hier!!



--Einfache ABfragen

SELECT   SPALTEN, SPALTEN, ...
FROM  TABELLEN, SICHTEN
WHERE BEDINGUNGEN	
ORDER BY Soretieren  nach Spalte



select 
* 		  --* steht für alle Spalten der FROM Tabellen
from
		Customers



select 
	Customerid, companyname, contactname, country, city
 from 
		Customers


--TIPP:
--Verwende ALIAS


select 
		c.Country, c.City, c.CompanyName, c.CustomerID
from customers c


--Lasst euch aus Orders 
--die BestNr , die Frachtkosten, die Kundennr und das Bestelldatum zuürckgeben


select 
	o.OrderID,o.CustomerID,o.Freight,o.OrderDate
from orders o
---und formatieren

select 
	  freight		as Frachtkosten
	,  Orderid		as BestNr
	,  orderdate		as Bestelldatum
	, customerid	as KundenNr
from orders


select * from employees	e

select * from [Order Details]
select * from orders




select * from customers
order by country asc, city 	desc



-- Sortiert die Bestellungen nach Fracht absteigen 
-- und dann nach Fracht aufsteigenb
-- und was ist jeweils der höchste Wert der Frachtkosten und der kleinste

select top 1 freight from orders order by freight asc --	 0,02

select * from orders order by freight desc -- 1007,64
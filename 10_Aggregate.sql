--AGGREGATE
--SUM, MIN, MAX; AVG, COUNT

select sum(freight) as Summe, AVG(freight), count(*), 
 max(freight), min(freight) from orders


select count(customerid) from customers

select count(region) from customers	  --nur 31, weil NULL vorkommen

select count(*) from customers	  --alle 91


--Wieviele Kunden gibt es pro Land

select country, count(*) from customers
group by   country


--Wieviele Kunden gibts pro Stadt in USA


select city as Stadt, count(*) from customers
where country = 'USA'
Group by city 


select country, city, count(*)
from customers
group by  country, city
order by country, city

--Wie hoch ist der Durchschnitt der Frachtkosten pro Angestellten (Employeeid)

select employeeid , avg(freight) from orders
group by employeeid






--Was hat der Kunde Umsatz generiert
--Liste aller Kunden und deren Umsatz


Companyname, Unitprice, quantity


select Companyname, Unitprice, quantity	, o.orderid
from 
	customers c inner join orders o on c.CustomerID=o.CustomerID
				inner join [Order Details] od on od.OrderID=o.OrderID


select Companyname, sum( Unitprice * quantity)	
from 
	customers c inner join orders o on c.CustomerID=o.CustomerID
				inner join [Order Details] od on od.OrderID=o.OrderID
GROUP BY	 Companyname



--Kunde mit höchstem Umsatz
select top 1 Companyname, sum( Unitprice * quantity)	
from 
	customers c inner join orders o on c.CustomerID=o.CustomerID
				inner join [Order Details] od on od.OrderID=o.OrderID
GROUP BY	 Companyname
order by 2 desc


select  Companyname		--, Unitprice * quantity
	, max( Unitprice * quantity)	
from 
	customers c inner join orders o on c.CustomerID=o.CustomerID
				inner join [Order Details] od on od.OrderID=o.OrderID
			
GROUP BY	 Companyname
order by 1



--Wieviel Umsatz machte das Produkt Chai Tea
--Idee 1:
select 
	sum(od.Quantity* od.UnitPrice)
from products p inner join [Order Details]  od on od.ProductID=p.ProductID
where p.ProductName like '%Chai%'

--Idee2: Verwende die Sicht, die bereits die  Joins und  Possummen enthält 
select sum(possumme) from vverkauf where productname like '%Chai%'


 --alle Städte , in denen mehr als 1 Kunde ist...
select city, count(*) as Anzahl from customers
where anzahl > 1 ... geht nicht 
group by city

 select city, count(*) as Anzahl into #t1 from customers
group by city

select * from #t1 where anzahl > 1

--theoretisch auch mit Sicht oder Unterabfrage


--Es gibt dazu aber das HAVING 

select ...AGG 
from Tabelle
where ..
group by sp having agg > Wert
Order by 



--Idee1

select city, count(*) as Anzahl from customers

group by city having count(*) > 1


  select city, count(*) as Anzahl from customers

group by city having city = 'London'   --dumme Idee.. das muss in das where

------------------------------------------------------------------
--Group by mit WITH CUBE und ROLLUP
------------------------------------------------------------------


 Select country, city, count(*) from customers
 group by country, city	 with cube



 Select country, city, count(*) from customers
 group by country, city	  with rollup



 --Prozeduren  --best practices
 --Variablen
 --Funktion

--CASE WHEN
--WHILE
--IF









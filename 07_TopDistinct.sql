/*
Ergebnisse von Abfragen können noch weiter beeinflusst werden.
Mit TOP und DISTINCT filtern zb Doppelte Datensätze aus dem Ergebnis heraus (DISTINCT)
oder geben nur die ersten (TOP) Treffer aus.

Der TOP kann noch weiter bestimmt werden durch die Anzahl n (TOP N) 
oder durch eine Prozentangabe (TOP N PERCENT).
Allerdings wäre das ERgebnis des TOP Befehls nicht vorhersehbar ohne ein ORDER BY, da die Reihenfolge
der Datensätze nicht garantiert ist.

Manchmal kann es vorkommen, dass der letzte Wert, nachdem sortiert wurde einen weiteren übereinstimmende Wert danach besitzt. Um diesen "Überhang" darzustellen kann man die Klause WITH TIES verwenden (Biuldlich eine Krawatte). Dann werden alle Datensätze ausgegeben, die den gleichen Wert wie der letzte Datensatz haben.


*/


--Distinct filter doppelte DAtensätze der Ergebnis
--TIPP:
-- erzwinge nie einen Distinct, wenn es keine doppelten Zeilen geben kann. 
-- zB. ID Werte


select distinct city, customerid from customers


--DEMO
--Höchster und kleinster Frachtkostenwert


select top 1
	freight 
from orders 
order by freight asc   --0.02



select top 1
	freight 
from orders 
order by freight desc  --1007,64


select top 13 * from orders order by freight

select top 10 percent * from orders order by freight



--Firma = Wilde 13
--13 jähriges Jubläum
--13 Kreuzfahrten
--top 13 Kunden

---die top 13 Kunden gemessen an Frachkosten   aufsteigend
--Kunden und Frachtkosten

select top 13 with ties customerid, freight  from orders order by freight


select city from customers
UNION ALL  --filter keine doppelten Zeilen
select city from employees


select 100
UNION
select 200
UNION 
select 300
UNION	   --filter doppelte Ergebniszeilen
select 100



select customerid, companyname, city, country
INTO CustomersEU
from customers
where
	country in ('Italy', 'Ausstria', 'Germany', 'France')	  --25



 --UNION : alle Tabelle müssen selbe Spaltenzahl ausgeben
 --und Datentypen müssen kopatibel sein
select customerid, companyname, city, country from customers
UNION
select customerid, companyname, city, country from customersEU

select customerid, companyname,  country from customers
UNION  ALL
select customerid, companyname, country from customersEU


--gibt es zwischen diesen beiden Tabelle identisch Datensätze

select customerid, companyname, city, country from customers
INTERSECT
select customerid, companyname, city, country from customersEU


select  city from customers
INTERSECT
select  city from customersEU



--welche Datensätze komme in CustomerEU vor, aber nicht in Customers

select  customerid, companyname, city, country from customersEU
except
select  customerid, companyname, city, country from 	  Customers



select  customerid, companyname, city, country from Customers
except
select  customerid, companyname, city, country from 	  customersEU



















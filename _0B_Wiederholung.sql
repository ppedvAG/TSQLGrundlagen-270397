					 /*
SELECT
		Spalten, 
		Spalten as ALIAS
		F(),
		* ,
		Zahlen, Text
		Mathe
		(SUBSELECT).. darf aber nur einen Wert zurückgeben (1 Spalte 1 Zeile)
FROM
	   TABELLE T1  LEFT|RIGHT|INNER JOIN TABELLE T2 ON T1.Spaltex = T2.Spaltex
				   LEFT|RIGHT|INNER JOIN TABELLE T3 ON T3.Spaltex = T2.Spaltex | T1.Spaltey
				   JOIN mit etwas Tabellenartigen
				   JOIN (SELECT ....) T4 on T4.sp = t2.sp
				   ....
WHERE
		Spalten  = , < >, BETWEEN, LIKE, IN, IS NULL, !=, >=, <=
		AND |OR
		SPalte like '' Wildcards: 
									[] ...ist immer nur ein Zeichen
									_ ...ist immer nur ein unbekanntes Zeichen
									% steht für viele Zeichen, aber auch für keines
ORDER BY Spalte ASC|DESC, Ordnungszahl, Spalten desc, Alias des Select 



 --Welche Produkte haben wir nicht in Austria gekauft
 --Welche Kunden (Companyname) haben welche Produkte (Produktname) nicht gekauft.
 Der Kunde muss aus Österreich sein


Was haben welche Produkte nicht gekauft.



*/

select orderid as BestNr, freight  customerid from orders

--hier wird freight mit Customerid bezeichnet
select productname from products
except
select distinct p.ProductName
from customers c inner join orders o on o.CustomerID=c.CustomerID
			     inner join [Order Details] od on od.OrderID=o.orderid
				 inner join products p on p.ProductID =od.ProductID
where 
	c.country = 'AUSTRIA'



SELECT 
    c.CustomerID,
    c.CompanyName,
    p.ProductID,
    p.ProductName
FROM 
    Customers c
CROSS JOIN 
    Products p
WHERE 
    c.Country = 'Austria'
except
SELECT 
    c.CustomerID,
    c.CompanyName,
    p.ProductID,
    p.ProductName
FROM 
    Customers c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
JOIN 
    [Order Details] od ON o.OrderID = od.OrderID
JOIN 
    Products p ON od.ProductID = p.ProductID
WHERE 
    c.Country = 'Austria'





--hier wird freight mit Customerid bezeichnet
select productname from products
except
select distinct p.ProductName
from customers c inner join orders o on o.CustomerID=c.CustomerID
			     inner join [Order Details] od on od.OrderID=o.orderid
				 inner join products p on p.ProductID =od.ProductID
where 
	c.country = 'AUSTRIA'



select country , 'EU' from customers 

select freight *1.19 as BRUTTO, freight as Netto from orders

select orderid, freight,
(select top 2 freight from orders order by freight desc)
from orders


----------------------------------------------------------------------------

---Ich brauche die BestellNr und die Frachtkosten der Bestellungen, 
-- wo die Frachkosten am höchsten und am
-- niedrigsten sind in einer einzigen ! Ausgabetabelle

 ----------------------------------------------------------------------------

select orderid, freight from orders



select top 1 orderid, freight from orders --order by freight desc
UNION ALL
select top 1 orderid, freight from orders 
order by freight asc

--Variante 1:

SELECT * FROM 
			(select top 1 orderid, freight from orders order by freight desc) t1
UNION ALL
SELECT * FROM 
			(select top 1 orderid, freight from orders order by freight asc	) t2


--Variante 2: 
select top 1 orderid, freight
into #Frmax 
from orders order by freight desc



select top 1 orderid, freight into #Frmin from orders order by freight asc

select * from #Frmax
UNION ALL
select * from #Frmin

--Variante mit Sicht.. is aber am doof...



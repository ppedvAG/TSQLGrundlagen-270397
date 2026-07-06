						SELECT 
	Spalten, Spalten as ALIAS
	..
FROM TABELLE
WHERE
		SPALTE > < between, in 
		, like --Wildcards: _ , % , []
		AND | OR 
		SPALTE 
ORDER BY SPALTE, ALIAS, Ordnungszahl asc | desc


--JOIN:

--INNER JOIN
--LEFT | RIGHT JOIN
--CROSS JOIN

--INNER JOIN



SELECT * 
FROM TABELLE T1 JOIN (LEFT/RIGHT/INNER) TABELLE T2
	ON T1.SP = T2.SP


select 
	c.customerid, c.companyname,
	o.*
from 
	customers c inner join orders o 
	on c.customerid = o.customerid
order by c.customerid



--Zeige den Angestelltennamen, 
--die Bestellnummer und die Frachtkosten 
--und das Bestelldatum an

--es müssen 830 Zeilen rauskommen


select 
	  e.LastName , e.FirstName
	, o.OrderDate, o.freight, o.orderid
FROM 
	Orders o inner join Employees e		
			ON 
				o.EmployeeID = e.EmployeeID


 select * from [Order Details]

 --Liste mit Bestellnummer, Menge, Preis, Produktname und 	 PosSumme
 -- Qunatity * Unitprice as PosSumme
-- wir brauchen zusätzlich die Tabelle Products 

  select 
		od.OrderID, od.UnitPrice, od.Quantity
	,	p.ProductName
	,	(od.UnitPrice* od.Quantity) as Possumme  
  from 
		[Order Details]  OD inner join Products P
			ON 
					P.ProductID = OD.ProductID


   --JOIN über mehr Tabellen


   SELECT	
   *
   FROM TABELLE T1 JOIN TABELLE T2 ON t1.sp = t2.sp
				   JOIN TABELLE T3 ON t2.sp = t3.sp
				   JOIN TABELLE t4 on t3.sp = t4.sp



   --welche Firma hat welches Produkt gekauft?

   	--Customers --> Orders -- Order Details --> Products
	--        customerid	orderid		productid

	SELECT 
			c.CompanyName, p.ProductName
	FROM
			Customers c inner join orders o on c.customerid = o.customerid
						inner join [Order Details] od on od.OrderID=o.orderid
						inner join products p on p.ProductID= od.ProductID
	order by c.CompanyName, p.ProductName



	---Ergänze diese Abfrage um den Namen des Angestellen,
	-- der das Produkt verkauft

SELECT 
		c.CompanyName, p.ProductName, e.lastname
FROM
		Customers c		inner join orders o			  on c.customerid = o.customerid
						inner join [Order Details] od on od.OrderID   = o.orderid
						inner join products p		  on p.ProductID  = od.ProductID
						inner join Employees e		  on e.EmployeeID = o.EmployeeID
order by 
		  c.CompanyName
		, p.ProductName		


 --Gibt es Kunden die nichts kauften

 --LEFT und RIGHT JOIN
--Falls es keine Übereinstiummung gbt, muss SQL Server dennoch etwas ausgeben:: NULL
--wie suche ich nach NULL 
--da jeder math Vergleich immer zu NULL führt   sp = NULL.. führt zu keinem Ergebnis
-- where sp is null

 select * 
from 
			Tabelle t1 left join Tabelle t2 on t1.sp = t2.sp


select * 
from 
			Tabelle t2 right join Tabelle t1 on t1.sp = t2.sp


 --Left join:  die Tabelle , die links vom Join steht
 --Right join: die Tabelle , die rechts vom Join steht

select * 
from 
		customers c left join orders o on c.customerid = o.customerid
 where o.orderid is null


 select 
		c.*, o.*
 from 
		orders o right join customers c on c.customerid = o.customerid
 where 
		o.orderid is null


--Gibt es Bestellungen mit Kunden, die nicht existieren

select 
		o.customerid, c.CustomerID
from 
		orders o left join customers c on c.CustomerID=o.CustomerID
where 
		c.CustomerID is null
		--muss leer Menge sein


 --was macht dieser Join
select * from customers cross join orders

select 92*830	  --76360


	  select * from customers
	  select * from employees


	  --Gib die Kunde aus und den Angestellten, der in der seleben Stadt wohnt , wie der Kunde


select 
		  c.CompanyName, c.city
		, e.lastname,    e.city
 from
		customers c inner join employees e on c.city = e.city


 --Eine Liste mit all den Städten, in denen kein Angstellter ist

 select 
		  c.CompanyName, c.city
		, e.lastname,    e.city
 from
		customers c left join employees e on c.city = e.city
where e.city is null


 --ich brauche alle Angestellten und deren Stellvertreter
 --Stellvertretung = man muss in der gleichen  Stadt sein
select 
	e1.lastname, e1.city, e2.lastname, e2.city 
from 
	employees  e1 inner join employees e2 ON e1.city = e2.city
--man muss noch filtern, dass ein Angestellter sich nicht selbst vertreten kann
where
		e1.lastname <> e2.lastname
order by e1.city




















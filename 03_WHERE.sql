select * 
from tabelle
where 
order by 


-- where filtert die DAtensätze , die der SQL Server 
--verarbeiten soll


-- INDIZES.. ohnbe diese wird es langasm.. Kann man im Plan sehen



--where
	=
	<
	>
	>=
	<=
	<> 	!=
	between
	in
	like -- einzige, was Wildcards kennt


	Wildcards: % steht für viele beliebige Zeichen .. auch 0






	select * from orders 
	where 
		freight < 10
   -- order by freight desc


   --Alle Orders Datensätze mit freight > 500 

   select * from orders where freight >=  500


   --Wieviele Datensätze sind nicht 500 bei Freight

   select * from orders where freight != 500



   --like

   select * from customers

   -- % steht für beliebig viele Zeichen

   --alle Kunden, die mit A beginnen
   select * from customers
   where 
			companyname like 'A%'

--Welche Kunden enden mit y im Firmenname


select * from customers
where 
	CompanyName like '%y'



--welche Kunden Kunden beginnen mit B und enden mit L

--0 ?

select * from customers
where 
	CompanyName like 'B%L'


--suche alle Kunden , 
--die mit C beginnen und mit e enden und im Namen ein
--y haben


select * from customers
where 
	CompanyName like 'C%y%e'


 --Alle Bestellungen zwischen 10 und 100
 -- inklusive


 --falsch
 select * from orders
 where freight >= 10 and <= 100


 select * from orders
 where freight >= 10 and freight <= 100


 --Alternative

 select * from orders
 where freight between 10 and 100
 --identisch mit: freight >= 10 and freight <= 100


-- > und < gehen auch mit Buchstaben oder DAtum


 select * from customers where customerid < 'D'



 --oder mit DAtum

 select * from orders where orderdate < '1.1.1998'
 order by orderdate desc



 --Spalten kombinieren:
 -- AND und OR


 --ich such e alle Kunden aus UK und USA


 select * from customers
 where country = 'UK' or country = 'USA'


 --suche in Orders alle Bestellungen,
--deren Frachtkosten < 100 sind 
--und der Kunde mit 'A' beginnt


select * from orders
where
	freight < 100 AND customerid like 'A%'



--Alle Bestellungen mit
--frachtkosten < 50 
--und customerid soll ein U enthalten 
--oder das Shipcountry = UK'

 --immer Klammer setzen
select * from orders
where
	freight < 50
	AND
	(Customerid like '%U%'  
	OR
	SHIPCOUNTRY = 'UK' )








select * from orders
where
	SHIPCOUNTRY = 'UK'
	OR
	freight < 50
	AND
	Customerid like '%U%'

	--SQL bindet das AND immer vorrangig
	

  --Wir brauchen alle Kunden
--aus UK, USA, Italy und Germany


--Customers (country)


select * from customers
where
	country = 'UK'		OR
	country = 'USA'		OR 
	COUNTRY = 'Italy'	OR 
	Country = 'Germany'


--geht das nicht besser.. im Sinne von kürzer?
--mit IN

select * from customers
where
	country in  ('UK','USA','Italy','Germany')


--  Wir brauchen alle Kunden
-- aus einem Land das mit U beginnt oder 
-- mit i beginnt oder mit G beginnt

 
select * from customers
where
	country in  ('U%','I%','G%')
	--nix, weil das = keine Wildcards kennt

 --muss man so schreiben

select * from customers
where
	country like 'U%'		OR
	COUNTRY like 'I%'	OR 
	Country like 'G%'


--welche Companyname gibts, 
--in denen ein % enthalten ist


select * from customers
where companyname like '%'

--Produkt-Preis
--Order Details
-- []

 --suche nach Prozent
select * from customers
where companyname like '%[%]%'



--Firma:  La maison d'Asie


--Suche alle Firmen, die im Namen ein ' haben

 -- #Escape
 select * from customers
where companyname like '%''%'


 --Eckige Klammern stehen für 1 Zeichen, können aber Bereiche abdecken
 --[0-5] steht für 0,1,2,3,4,5
 --[a-e] steht für a,b,c,d,e

 --das geht auch kürzer

 select * from customers
where
	country like 'U%'		OR
	COUNTRY like 'I%'	OR 
	Country like 'G%'

   select * from customers
where
	country like '[uig]%'
order by 1

--[a-c|r-z]	 --die Pipe steht für oder

--Was, wenn eine bestimmte Position unbekannt ist

-- 0153-234?6?8
--der _ steht für genau ein unbekanntes Zeichen


--Suche alle Kunden, derern Firmename 
--deren drittletzter Buchstabe ein A ist


select * from customers
where
	companyname like '%A__'

---1234 --> ws30


-Tabelle mit Spalte PIN

--Kunde  (Spalte PIN)

select * from kunde 
	where PIN >= 1000 and PIN <= 9999

	--geht nicht wg zB 0001


--immer 4 Stellen

--[0-9][0-9][0-9][0-9]


select * from kunde 
	where PIN not like 	 '[0-9][0-9][0-9][0-9]'



 --Suche nach 

 select * from kunden where 
 famname like 'Meyr'


 select soundex('Meier'), soundex('Maier') , soundex('Mayr')



  --Suche nach Kunden, die
  -- im Firmanname

  --sie sollen mit Abcd beginnen  oder mit s bis u
  --mit klmo enden
  --dawzischen soll ein y oder z sein
  --und der 3. letzter Buchstabe muss ein n sein


  select * from customers
  where 
		companyname like '[a-d|s-u]%[yz]%n_[klmo]'


    select * from customers
  where 
		companyname like '[a-d|s-u]%'
		and
		companyname like '%[yz]%n_[klmo]'


select * from  [dbo].[Summary of Sales by Quarter]




































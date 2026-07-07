		  --Systemfunktionen

/*
Funktkionen können grundsätzlich an allen Stellen in TSQL Statements auftauchen:

select f(Spalte), f(Wert) from f(Wert) 
where f(Spalte) = f(Wert)	

In SQL Server gibt eine Vielzahl von Systemfunktionen, die in TSQL Statements verwendet werden können. Diese Funktionen können in SELECT-Anweisungen, WHERE-Klauseln, JOIN-Bedingungen und anderen SQL-Statements eingesetzt werden, 
um Daten zu manipulieren, zu formatieren oder zu analysieren.

Im Objektexplorer des SSMS kann man diese gut finden unter:
Programmierbarkeit--> Funktkionen innerhalb einer jeden Datenbank


*/

select * from orders

---Datum:

/*
year()
datepart(yy,DAtum)
*/


--Welche Bestellungen sind aus dem Jahr 1997

select * from orders
where orderdate like '%1997%'	   --408			aber langsam


select * from orders
where orderdate    between '1.1.1997' and '31.12.1997' --408 ..korrekt aber falsch

--Problem: orderdate geht aus ms genau

select * from orders
where orderdate    between '1.1.1997' and '31.12.1997 23:59:59.997' --411 ..korrekt aber falsch
order by orderdate desc

--datetime ist ungenau  2ms varianz
--datetime2 .. geht aus ns 


select * from orders
where year(orderdate) = 1997 --korrekt, kürzter, aber nicht schneller

select * from orders
where datepart(yy,orderdate) = 1997 --korrekt, kürzer, aber nicht schneller

select * from orders
where month (orderdate ) = 2   --gfeht auich mit Monat


--Quartal 2
select * from orders
where quarter (orderdate ) = 2	  --gibts nicht

select * from orders
where datepart(qq,orderdate) = 2 



select getdate()

select datediff(dd,getdate(), '31.12.2026')	  --178


--welche Bestellungen kamen zu spät
--Shippeddate und Requireddate

--zuerst "untersuchen"
select datediff(dd, shippeddate, requireddate) as Difftage ,* from orders
where 
	datediff(dd, shippeddate, requireddate) < 0


--in 100 Tagen

select dateadd(dd, 100, getdate()) as in100Tagen


select dateadd(dd, -100, getdate()) as vor100Tagen


--Wochentag

select datename(mm, getdate()) as Monat

--welchen Wochentag haben wir heute

 select datename(dw, getdate()) as Wochentag


 ---was ist der letzte des MOnats ... Datum


 select EOMONTH(getdate())




 --Arbeiten mit Text

 --Vorname : Otto

 --char(20)		 : 'otto                ' 20 
 --varchar(20)	 : 'otto'  4
 --text()		  : kann 2 GB werden, aber nicht mehr verwenden
 --nchar()	     : 'otto                     ' 20*2  = 40
 --nvarchar()	 ' 'otto' 4*2 )= 8


  select datalength(rtrim('otto                    '))
  select datalength(' otto                    ')


  select substring('abcdefg', 1,3 )


  select stuff('abcdefgh', 1,3, 'XXXXXX')

  select left(customerid, 2) from orders
  where left(customerid,1) = 'A'   --besser mit like 
















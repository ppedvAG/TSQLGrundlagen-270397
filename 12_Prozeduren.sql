select * from orders where orderid = 10248

select * from vverkauf


select * from customers c inner join orders o on c.CustomerID=o.customerid
where o.orderid = 10248


dbcc freeproccache

set statistics io, time off
select * from vverkauf


--Warum Prozeduren
--Komplette Logik in einem Statement

--eine SP kann aus : SEL, UP, DEL, INS.. auch vielfach
--Prozeduren gleichen eine Windows Batchdatei: kann viel drin stehen und mit einem KOmaanndo ausgeführt
--auch nach Neustart wiederverwendbar
--Vorteil: Der Plan wird beim ersten Aufruf erstellt und muss auch nach Neustart nicht mehr neu erstellt werden
--man spart: Analyse und Kompilierzeit --> CPU und RAM

 --Grundgerüst einer Prozedur
create proc gpname1
as
select getdate()

create proc gp_SucheKunden @Land varchar(20)
as
select * from customers where country = @Land


exec gp_SucheKunden 'UK'	  --jetzt wird der Plan fixiert


 create or alter proc gp_SucheKunden @Land varchar(20), @Stadt varchar(50) = '%'
as
select * from customers where country = @Land	 and city like @stadt


exec gp_SucheKunden 'USA' ,'Seattle'


select * from customers
--customerid nchar(5)

--Erstelle eine Prozedur, die folgendes löst:
--Bei Angabe von ALFKI darf nur einer als Ergebnis kommen
--gibt man A ein, müssen alle Kunden kommen, die mit A beginnen


-- --customerid nchar(5)
exec gpSucheKdid 'ALFKI' --1
exec gpSucheKdid 'A' --4
exec gpSucheKdid --alle

select 1+2
select 'A' + 'B'
select '1' +'A'
select NULL +2


 create or alter proc gpsucheKdid @CustId varchar(5) ='%'
 as
 select * from customers where customerid like @Custid +'%'





 PROC kann auch INS UP DEL


delete
-- select *
 from customersEU 	where customerid = 'ALFKI'

 --lösche alle Kunden aus CustomersEU, die in Orders weniger als 20 Frachtkosten haben

 --Zuerst der SELECT 

  delete  customersEU
 --select distinct companyname 
 from 
 customersEu c inner join orders o on c.customerid = o.customerid
 where o.freight < 20	



--UPDATE

select * from customersEU

update custmersEU set city = 'Vendig' where city = 'ROM'
select * from customersEU 
where
city = 'ROM'


select * from customersEU c inner join orders o on c.customerid = o.customerid
where o.freight < 20

--Aktualsiere die DAtensätze in CustomersEU, die vom Ang Nr 8 betreut wurden und schreibe 
--in das Feld Land den Wert X

update customersEU set city = 'X'
--select distinct companyname, country 
from customersEU c
	inner join orders o on c.customerid = o.customerid
where employeeid = 8




----Lösche mit einer Prozedur den Kunden BLAUS	  (soll natürlich ein Parameter werden)
--Tipp: 
	--zuerst die Order Details des Kunden, dann die Orders 
	--und dann erst kann der Kunde gelöscht werden

--Schritt 1:
--zuerst die Datensätze finde, die glöscht werden sollen
select * from  [Order Details] od inner join orders o on o.OrderID=od.orderid
	where o.customerid = 'BLAUS'
select * from orders  where customerid =  'BLAUS'
select * from customers	 where customerid = 'BLAUS'


select * from [Order Details]
	where orderid in (select orderid from orders where customerid = 'BLAUS')

--Schritt 2
--Erstellen der Prozeduren mit Parameter ..der SLECT bleibt vorerst


 create or Alter proc gp_delKunden @CustID varchar(5)
 as
 select * from  [Order Details] od inner join orders o on o.OrderID=od.orderid
	where o.customerid = @CustID
select * from orders  where customerid =  @CustID
select * from customers	 where customerid = @CustID


--Schritt 3: Test

exec gp_delKunden 'Blaus'


--schritt 4: Umbau auf Delete

  create or Alter proc gp_delKunden @CustID varchar(5)
 as
 delete [Order Details] from  [Order Details] od inner join orders o on o.OrderID=od.orderid
	where o.customerid = @CustID
delete  from orders  where customerid =  @CustID
delete  from customers	 where customerid = @CustID


 exec gp_delKunden 'Blaus'


 
 create or Alter proc gp_delKunden @CustID varchar(5),@test int  =1
 as
 IF @test = 1
 BEGIN 
		 select * from  [Order Details] od inner join orders o on o.OrderID=od.orderid
	where o.customerid = @CustID
	select * from orders  where customerid =  @CustID
	select * from customers	 where customerid = @CustID
 END
 ELSE
 BEGIN
		  delete [Order Details] from  [Order Details] od inner join orders o on o.OrderID=od.orderid
		where o.customerid = @CustID
	delete  from orders  where customerid =  @CustID
	delete  from customers	 where customerid = @CustID
 END


 delete [Order Details] from  [Order Details] od inner join orders o on o.OrderID=od.orderid
	where o.customerid = @CustID
delete  from orders  where customerid =  @CustID
delete  from customers	 where customerid = @CustID

   begin tran
  exec gp_delKunden 'ANATR', 0
   rollback



  begin tran
  select @@TRANCOUNT
  select * from customers where customerid = 'FISSA'
  delete from customers where customerid = 'FISSA'

  rollback

  commit




























--Wie kann ich auf Ergbnisse der Proc zurückgreifen


create or alter proc gpdemo1 @shipcountry varchar(20) 
as
select avg(freight) from orders where shipcountry = @shipcountry

exec gpdemo1 'USA'

--
declare @varFracht money


create or alter proc gpdemo1 @shipcountry varchar(20), @parFracht money output --auch input 
as
select avg(freight) from orders where shipcountry = @shipcountry
select @parfracht = avg(freight) from orders where shipcountry = @shipcountry

exec gpdemo1 'USA', @parfracht ist aktuell auch Pflicht



exec gpdemo1 @parfracht=12, @Shipcountry='USA'


exec gpdemo1 'USA', @parfracht = @var output


declare @ergebnis as money

exec gpdemo1 'USA', @parFracht = @ergebnis output 

select @ergebnis


--Will man mit Tabellen arbeiten, dann ##tabellen












select * from orders where freight <  (Ergebnis aus Proc)
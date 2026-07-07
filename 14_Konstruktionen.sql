							 ---KOnstruktionen

WHILE


WHILE (BEDINGUNG  )
	BEGIN
		BREAK 
		COntinue
		Code
	END


declare @i as int=1
select @i
WHILE @i <=10
	BEGIN
	select @i
	IF @i=5 continue
	   set @i += 1 --set @i = @i+1   nie so: set @i=+1
	END


  IF 1=0 select 100

select sum(freight), max(freight) from orders


--Erhöhe die Frachtkosten um 10% solange bis
--die Summe 100000 erreicht wurde oder der Max Wert 1500
--aber kein Wert darf überstiegen werden

--das stimmt so nicht ...
--Tipp: begin tran
BEGIN TRAN
While 
	(select sum(freight) from orders) <=100000/1.1
	AND
	(Select max(freight) from orders) <= 1500 /1.1
BEGIN
	Update orders set freight = freight *1.10
	Select sum(freight) , max(freight) from orders--wo landen wir?
END
Select sum(freight) , max(freight) from orders--wo landen wir?

ROLLBACK
--zuviel :-(   --104319,8811	--1622,8143



IF 1=1
BEGIN
	select 100
END
ELSE
BEGIN
select 200
select 300
END

IF 1=0 select 100 else select 200



IF (Select count(*) from customers) > 100
select 'Es gibt mehr als 100'
ELSE
select 'Es gibt weniger als 100'



--Wenn ein Kunden weniger als 100 Frachtkostn hat , dann als A Kunde bezeichnen
-- sonst ein B Kunden
--Wenn ein Kunden weniger als 500 Frachtkostn hat , dann als C Kunde bezeichnen



--Gib eine Liste aus mit Customerid, freight und TYp A B oder C
--nur Tabelle Orders

select *, 'A' from orders

select customerid, freight ,'A' as Typ from orders where freight < 100
UNION ALL
select customerid, freight ,'B' as Typ from orders where freight between 100 and 500
UNION ALL
select customerid, freight ,'C' as Typ from orders where freight > 500


--CASE WHEN 

select customerid , freight,
	CASE 
		WHEN freight < 100 then 'A'
		WHEN freight > 500 then 'C'
		ELSE 'B'
	END as TYP
from orders


select customerid , freight,
	CASE 
		when shipcountry like 'U%'  then 'ULänder'
	end
from orders

--nur die As

select customerid , freight,
	CASE 
		WHEN freight < 100 then 'A'
		WHEN freight > 500 then 'C'
		ELSE 'B'
	END as TYP
from orders
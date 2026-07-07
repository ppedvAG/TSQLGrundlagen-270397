	  ----Funktionen


select f(Wert), f(spalte) from f(Wert) where f(Spalte) > (F(wert)


create or alter function fdemo(@par1 int, @par2 int)
returns int
as
Begin
   return ()
end


create or alter function fCalc(@Wert1 int, @Wert2 int) returns int
as
BEGIN 
		 return(select @wert1*@wert2  )

END

select dbo.fCalc (12,3)




--Rechnungsumme

select fRngSumme(10248)

create or alter function fCalc(@Wert1 int, @Wert2 int) returns int
as
BEGIN 
		 return(select @wert1*@wert2  )

END


select sum(unitprice *quantity) from [order details]
where orderid = 10248 ;
GO



create or alter function fRngSumme(@Bestid int) returns money
as
BEGIN 
		 return
		 (select sum(unitprice *quantity) from [order details]
		 where orderid = @Bestid)

END	 ;
GO


select dbo.fRngSumme(10248) 



select 	 dbo.fRngSumme(orderid), * from orders
where dbo.frngsumme(orderid) > 1000

alter table orders add RngSumme as 	dbo.frngsumme(orderid)

select * from orders

set statistics io, time  on
select  * from orders 




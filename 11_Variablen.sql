										--Variablen

/*

lokale Varible: @Var   existiert nur während der Laufzeit	und existiert 
nur in der Erstellersession

globale Variable: @@var
Existiert auch in anderen Sessions


*/


declare @var1 as int
set @var1 = 10

select @var1



declare @schnittfracht as money
set @schnittfracht = 78.2442


select freight, @schnittfracht, freight - @schnittfracht as differenz
from orders
where freight <= @schnittfracht

select @schnittfracht= avg(freight) from orders
select @schnittfracht

declare @var2 as int = 10
select @var2



--Welche Orders liegen unter dem Durchscnitt der Frachtkosten


select * from orders
where freight < (select avg(freight) from orders)



declare @schnittfracht2 as money  = (select avg(freight)*1.2 from orders)
print @schnittfracht2

select * from orders
where freight < @schnittfracht2


declare @var3 as int = 10
select @var3

GO

select @var3

select 100
GO 3







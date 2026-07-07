								  --CTE
WITH CTE as 
(
select * from orders
)
select * from cte

WITH CTE
as
(
select customerid , freight,
	CASE 
		WHEN freight < 100 then 'A'
		WHEN freight > 500 then 'C'
		ELSE 'B'
	END as TYP
from orders)
select * from cte where typ = 'A'

 ;with CTE as
 (
select employeeid, max(freight) as MaxFracht   from orders
group by employeeid
)
select sum(maxfracht) from cte

--



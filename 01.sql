select C.country as CountryCode, count (O.ordid) as TotalOrders
from Customers C 
	join Orders O on O.ocust = C.custid 
where O.odate >= '01/01/2017' and O.odate < '01/01/2021' 
group by C.country;
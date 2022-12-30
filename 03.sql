Select C.custid as CustomerID, C.cname as CustomerName, MAX(O.odate) as OrderDate 
from Customers C 
	join Orders O on O.ocust = C.custid 
group by C.custid;
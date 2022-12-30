select P.pcode as productcode, P.price as productprice 
from (
    Select D.pcode, avg(D.qty) 
    from Details D 
    group by D.pcode 
    having avg(D.qty) >= 3) as A join Products P on P.pcode = A.pcode;
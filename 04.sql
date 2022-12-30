Select D.ordid1 as orderid, D.odate as OrderDate, P.ptype as ProductType 
from (
    ((select D.ordid as ordid1 
    from Products P 
    join Details D on P.pcode = D.pcode 
    group by D.ordid 
    having count(distinct P.ptype) = 1) as A 
    join (
        select D.ordid, MAX(D.pcode) as pcode1 
        from Details D 
        group by D.ordid) as B on A.ordid1 = B.ordid) as C 
        join Orders O on O.ordid = C.ordid1) as D 
        join Products P on P.pcode = D.pcode1;
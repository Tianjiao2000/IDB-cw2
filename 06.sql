select A.pcode as productcode, A.tot as timsordered
from (
    Select P.pcode, P.ptype, B.tot 
    from Products P 
    join (
        Select D.pcode as dcode, sum(D.qty) as tot 
        from Details D 
        group by D.pcode) as B on P.pcode = B.dcode) 
    as A
where A.tot>(select avg(tot)*1.5
from (
    Select P.pcode, P.ptype, C.tot 
    from Products P 
    join (
        Select D.pcode as dcode, sum(D.qty) as tot 
        from Details D 
        group by D.pcode) as C on P.pcode = C.dcode) 
    as other
where A.ptype=other.ptype and A.pcode<>other.pcode);
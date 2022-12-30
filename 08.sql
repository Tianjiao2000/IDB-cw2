Select B.ocust as customerid, max(B.diff) as numdays 
from (
    Select ocust as ocust1 
    from Orders 
    group by ocust 
    having count(ordid) >= 2) as A 
    join (
        (Select case when O.odate > min(O1.odate) then (O.odate - min(O1.odate)) else (min(O1.odate) - O.odate) end as diff, O.ocust, O.odate, min(O1.odate) as date2 
        from Orders O join Orders O1 on O.ocust = O1.ocust and O1.odate > O.odate 
        group by O.ocust, O.odate)) as B on B.ocust = A.ocust1 
group by B.ocust; 
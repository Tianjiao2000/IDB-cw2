Select X.custid as CustomerID, X.bookqty as totalbooks 
from (
    select C.custid, sum(bookqty) as bookqty 
    from (
        Select * 
        from (
            Select D.ordid, sum(D.qty) as bookqty 
            from Details D 
            join Products P on D.pcode = P.pcode 
            where P.ptype = 'BOOK' 
            group by D.ordid) as A 
            join Orders O on O.ordid = A.ordid) as B 
            join Customers C on C.custid = B.ocust 
            group by C.custid) as X join (
                select C.custid, sum(other) as otherqty 
                from (
                    Select * 
                    from (
                        Select D.ordid, sum(D.qty) as other 
                        from Details D 
                        join Products P on D.pcode = P.pcode 
                        where P.ptype <> 'BOOK' 
                        group by D.ordid) as A join Orders O on O.ordid = A.ordid) as B 
                        join Customers C on C.custid = B.ocust 
                        group by C.custid) as Y on X.custid = Y.custid 
                        where X.bookqty > 2*Y.otherqty;
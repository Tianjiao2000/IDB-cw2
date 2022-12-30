select I.invid as InvoiceID, (A.tot - I.amount) as RefundAmount
from (
	select P.invid, SUM(P.amount) as tot 
	from Payments P 
	group by P.invid) as A 
	join Invoices I on I.invid = A.invid 
where A.tot > I.amount;
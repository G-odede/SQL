use hoteldatabase;

with maxpayment as(
select paymentid,amount,paymentdate
from payments 
where amount>=5000)
select max(amount)as totalamount
from maxpayment;

with totalcharges as(
select roomid,roomtype,charges
from rooms)
select roomtype,
sum(charges)as totalamount
from totalcharges
group by roomtype;



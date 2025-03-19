use sakila;

select amount,count(amount),sum(amount) from payment
group by amount;

-- windows => aggregate apply har row k sath
-- over()

select payment_id , amount ,
avg(amount) over(partition by amount order by amount desc) from payment ;


select payment_id , staff_id ,amount,sum(Amount) 
over(order by amount) from payment where payment_id <10;

create table customer1 (custmer_id int , cust_name varchar(20));
create table orders1(ord_id int, custmer_id int ,ord_price int);
insert into customer1 values(10,'ram'),(11,'radha'),(12,'nikita');
insert into orders1 values(1,10,200),(2,11,400),(3,11,700);
select * from customer1;
select * from orders1;

select c.custmer_id , count(o.custmer_id)
from customer1 as c left join orders1 as o
on c.custmer_id = o.custmer_id
group by c.custmer_id;

select c.cust_name , c.custmer_id
from customer1 as c join orders1 as o 
on c.custmer_id = o.custmer_id
where ord_id > 1;

select cust_name,custmer_id from customer1
where ( select count(ord_id) from orders1 where 
       orders1.custmer_id = customer1.custmer_id)>1;
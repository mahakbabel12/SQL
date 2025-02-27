-- self join

use test1;

create table staff(eid int , ename varchar(20),manager_id int);

insert into staff values(10,'tushar',null),(11,'aman',13),
(12,'sakshi',10),(13,'subham',11),(14,'ujjwal',12);

select * from staff;

select emp.eid ,emp.ename ,emp.manager_id ,mng.ename
from staff as emp join staff as mng
on emp.manager_id = mng.eid;

-- SET OPERATORS

use sakila;
select * from actor where actor_id = 2
union 
select * from actor where actor_id in (3,5);

-- it will not run
select * from actor where actor_id = 2
union 
select actor_id  from actor where actor_id in (3,5);

select * from actor where actor_id = 2
union 
select actor_id , first_name ,last_name ,last_update from actor where actor_id in (3,5);

select * from actor where actor_id = 2
union all
select * from actor where actor_id in (3,5);

-- python k difference operation se smiliar hai
select * from actor where actor_id in (2,3,4)
except
select * from actor where actor_id in (3,5);


select* from actor;
select * from film_actor;

desc actor;  -- know about primary key present or not

desc film_actor;

-- kis actor_id ne kitne movie bnai hai

select actor.actor_id , count(film_actor.film_id) as movies
from actor  join film_actor 
on actor.actor_id = film_actor.actor_id
group by actor.actor_id
order by movies DESC;

-- read
 -- datatypes in sql -->
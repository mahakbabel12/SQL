use sakila;
show tables;
describe actor ;
select * from actor;
select first_name ,ACTOR_id*100 from actor;
select * from actor;

select * from actor
where actor_id <> 2;

-- operator >,<,>=.<=,=,(<> , != ---->not equals to)
-- between , in and like operators

select * from actor
where actor_id between 1 and 5;

select * from actor
where actor_id in (2,5,8);

select actor_id , first_name  from actor
where first_name in ('NICK','ED');

-- like operator -->pattern dundta hai
-- special character(wild card character) 
-- 1.%--> zero or more character
-- 2. _ -->only 1 character

select * from actor
where first_name like 'E%';

select * from actor
where first_name like '%y';

select * from actor
where first_name like 's%y';

select * from actor
where first_name like '%a%';   -- 'a' khi p bhi ho sab jagah milega

select * from actor
where first_name like '%sa%' ;

select * from actor
where first_name like 'e%' ;

select * from actor
where first_name like 'e_' ;    -- e k baad only one character

select * from actor
where first_name like '_a' ;

select * from actor
where first_name like '_a%';

select * from actor
where first_name like '____';

select * from actor
where first_name like '%i__';

select * from actor
where first_name like '_%e_';

select * from actor
where first_name like '_r__';

select * from actor
where first_name like '_%ee%_';

select * from actor
where first_name like '_h%z_';









use sakila;

-- windows to find second highest salary

select * from 
(select amount ,
dense_rank() over (order by amount desc) as rating
from payment) as tab where rating = 2;

-- CTE

with tushar as 
(select amount ,
dense_rank() over (order by amount desc) as rating
from payment) 
select * from tushar;

select * from tushar;

create temporary table tus as select * from payment;

select * from  tus;

use sakila;

with
cte1 as (select * from actor where actor_id > 2),
cte2 as (select * from film_actor where film_id = 30)
select cte1.actor_id , film_id from cte1 join cte2
where cte1.actor_id = cte2.actor_id;

-- paramenterized cte

-- Declare a variable for parameterization

set @film_id = 2000;

WITH FilmCTE AS (
    SELECT film_id, title, release_year
    FROM film
    WHERE release_year > @film_id
)
-- Select results from the CTE
SELECT * 
FROM FilmCTE;

-- resurcive cte = until some condition satisfy
with recursive  num_table 
as (select 10 as num
   union
       select num+1  from num_table where num < 13)
select * from num_table;


with recursive ac
as (select actor_id , first_name , last_name 
from actor
where actor_id > 5
union 
select actor_id , first_name , last_name  from actor where first_name  = 'NICK')
select * from ac;

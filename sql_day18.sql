-- VIEWS
/* VIRTUAL TABLE

*/

USE regex1;
show tables;

-- ctas
create table payment as select * from sakila.payment;

select * from payment;

create view pay_view 
as select payment_id , customer_id from payment;


create table payment2 as select payment_id , customer_id  from sakila.payment
where payment_id < 5;

select * from payment2;

create view payment_v2 as select * from payment2;
insert into payment_v2 values(5,10);
select * from payment2; 

select database();   -- current database

create view pay_v2 as
select a.actor_id , a.first_name , a.last_name , f.film_id ,f.last_update from sakila.actor as a join sakila.film_actor as f
on a.actor_id = f.actor_id;

select * from pay_v2;

-- WITH CHECK OPTION

CREATE TABLE t1 (a INT);
CREATE VIEW v1 AS SELECT * FROM t1 WHERE a < 2
WITH CHECK OPTION;
-- Now, if we try to insert a = 3 into v1, it fails because 3 is not less than 2.
INSERT INTO v1 VALUES (3);  -- ❌ ERROR: CHECK OPTION failed
INSERT INTO v1 VALUES (1);


CREATE VIEW v2 AS SELECT * FROM v1 WHERE a > 0
WITH LOCAL CHECK OPTION;

CREATE VIEW v3 AS SELECT * FROM v1 WHERE a > 0
WITH CASCADED CHECK OPTION;


INSERT INTO v2 VALUES (1);  -- ❌ ERROR: CHECK OPTION failed
INSERT INTO v3 VALUES (1);  -- ❌ ERROR: CHECK OPTION failed

SELECT * FROM V2;
SELECT * FROM V3;
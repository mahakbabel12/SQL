create user test identified by 'test123';

-- table jisme user ki sari information( users name )-- 
select user from mysql.user;

GRANT ALL privileges ON SAKILA.* to test;

select * from mysql user where user='test';

show grants for test;

REVOKE ALL privileges ON SAKILA.* from test;

grant select ON SAKILA.* to test;

grant select(staff_id , first_name) on sakila.staff to test;

show grants for 'test';

ALTER USER 'test' identified BY 'regex';

alter user 'test' account Lock;

create role sales2;
grant select on sakila.* to sales2;

create user 'isha' identified by 'isha';
show grants for isha;
grant sales2 to isha;

set default role all to isha;

flush privileges;
show grants for "isha";
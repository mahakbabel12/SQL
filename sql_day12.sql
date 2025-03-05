use sakila;

-- second highest amount
select distinct(amount) from payment
order by amount desc limit 1,1;

-- second highest amount
select max(amount) from payment
where amount < (select max(amount) from payment);


-- DDL STATEMENT

-- DATA DEFINATION LANGUAGE
-- DATA KI INFORMATION DENA
-- WITH DATA -CREATE , DROP , ALTER

-- DML DATA MANIPULAYION LANGUAGE 
-- INSERTING ,UPDATE ,DELETE\\

create database march3;
use march3;

create table regex(id int , name varchar(20));
insert into regex values(1,'tushar');
insert into regex(name) values('goyal');
insert into regex(name) values('aman'),('ram');
insert into regex(name) values(null);

select * from regex;

-- ctas (create table as select )

create table y2 as select actor_id as a, first_name as f from sakila.actor;
select * from y2;
desc y2;

-- data hi copy hota hai only

-- delete
select * from y2;
delete from y2;

select * from y2;
delete from y2 where actor_id in (2,4);

-- update 
update y2 set f = 'regex';
select * from y2;

use sakila;
select * from actor;

update actor set first_name='mahak' 
where actor_id >2;

select * from actor;

-- DDL --> DROP , TRUNCATE
select * from actor;
drop table actor;

create table regex2(id  int , name  varchar(10));
insert into regex2 values(1,'mahak'),(2,'pratik');
select * from regex2;
truncate table regex2;

use march3;
create table companies(id int);
insert into companies values(10);
select * from companies;

desc companies;
 
-- add table columns
alter table companies
add column phone varchar(15);

alter table companies
add column emp int not null;

-- table me se column  ko delete krna
alter table companies
drop column emp;



select * from companies;

-- rename tables

rename table companies to newcompany1;
select * from newcompany1;

-- rename by alter
alter table newcompany1
rename to companies ;

alter table companies
rename column phone to company_name;

update companies set company_name ='tushar'
where id =10;

alter table companies add primary key(id);
add  constraint regex_company_uk unique(company_name);
alter table companies modify company_name int;
 
update companies set company_name =0;

alter table companies modify company_name int;
select * from companies;





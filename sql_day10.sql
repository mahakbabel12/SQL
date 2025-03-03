-- CONSTRAINTS-->
-- set of rules and regulations => invalid data
-- declaration of table
create database regex1;
use regex1;

create table employee01(id int);
insert into employee01 values(10),(20),(null),(30);

select count(id) from employee01;

select id , id+5 from employee01;

create table employee02(id int not null);
insert into employee02 values(10),(20);
-- insert into employee02 values(null); -- error
insert into employee02 values(30);
select id , id+5 from employee02;

drop table employee02;

create table employee02(id int,salary int default 0);
insert into employee02 values(10,99),(20,100);
insert into employee02(id) values(10);
insert into employee02(id,salary) values(20,null);
select * from employee02;

drop table employee02;

create table employee02(id int,salary int unique);
insert into employee02 values(10,99),(20,100);
insert into employee02(id,salary) values(20,1001); -- id can be similar but salary will be unique not duplicate value
insert into employee02 values(10,null);
insert into employee02 values(11,null);
 -- multiple null values can  exists
select * from employee02;  

-- primary key  
drop table employee02;
create table employee02(id int primary key,salary int unique);
insert into employee02 values(10,99),(20,100);
insert into employee02(id,salary) values(null,1001);  -- not run error
insert into employee02(id,salary) values(10,null);  -- error
insert into employee02(id,salary) values(10,100);
select * from employee02;

drop table employee02;
create table employee02(id int primary key,fname varchar(20),
salary int, 
constraint regex_emp_salary_uk unique(salary));
insert into employee02 values(10,'a',99),(20,'b',99);

create table student (id int ,
name varchar(20) , 
fees int not null,
college_name varchar(30) default 'regex',
phn_no int unique ,
constraint pk_student primary key(id,name),
constraint regex_phn_no_uk unique(phn_no),
constraint regex_fees_nn primary key(fees),
constraint regex_college_d default(college)

);


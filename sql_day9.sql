-- Data type in sql


CREATE database regex2;
use regex2;

-- DDL command 
create table employee1( eid int);
insert into employee1 values(2147483647);
select * from employee1;

create table employee2( eid int(4));
insert into employee2 values(1000000);
select * from employee2;

-- 4 values create krega 7-->0007,76-->0076
create table employee3( eid int(4) zerofill);
insert into employee3 values(76);
select * from employee3;

-- UNSIGNED INTEGER--->BADI VALUE INTEGER KI

create table employee4( eid int UNSIGNED);
insert into employee4 values(766758056);
select * from employee4;

-- BIG INT (8 BYTE) 2**64 (UNSIGNED)

-- INT-4
-- BIG INT-8
-- TINYINT-1BYTE --> -128 TO 127

-- TINYINT (IN BACKGROUD BOOLEAN VALUES ARE STORED IN TINYINT)

CREATE table employee20(id tinyint);
insert into employee20 values(127);
select * from employee20;

-- DECIMAL -->FLOAT AND DOUBLE

CREATE TABLE emp1(salary float);
insert into emp1 values(12.37567);
select * from emp1;


--    4-->(2-value,2-decimal value of total no.) , 2-->decimal k baad kitne value round hoga
CREATE TABLE emp2(salary float(4,2));
insert into emp2 values(12.39996);
select * from emp2;

-- varchar  = variable length character
-- char = fixed length character

-- wastage of memory

CREAte table ep2(name1 char(4));
insert into ep2 values("z   ");
select name1 , length(name1) from ep2;

CREAte table ep2(name1 char(5));
insert into ep2 values("zzqjw");
select name1 , length(name1) from ep2;

CREAte table ep_var(name1 varchar(4));
insert into ep_var values("z    ");
select name1 , length(name1) from ep_var;

-- date and time  (yyyy-mm-dd  hh:mm:ss --> date and time format)
-- yyyy-mm-dd date format
-- hh:mm:ss time format

create table test(dob date );
insert into test values("2022-05-12") ;
select * from test;

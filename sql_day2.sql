use sakila;
select * from actor;

select * from actor
where actor_id>2 and first_name = 'JOHNNY';

select * from actor
where actor_id>2 or first_name = 'JOHNNY';

-- priority and > or

select * from actor
where first_name = 'NICK' or first_name ='ED'and actor_id > 2;  -- phele and cond solve hogi then or

select * from actor
where (first_name = 'NICK' or first_name ='ED')and actor_id > 2;

-- FUNCTIONS
	-- BLOCK OF CODE => CODE RESUABLE
	-- CODE REDABLE
    
-- PREDEFINED FUNCTIONS -
    -- 1. STRING FUNCTION
    
select first_name ,lower(first_name),
upper(first_name)
from actor;

select first_name , last_name ,
concat(first_name ,'-', last_name,'x'),
concat_ws('-',first_name , last_name,'x')
from actor;

select * from actor
where concat(first_name,last_name) = 'EDCHASE';


-- 2.SUBSTRING-- 
select first_name ,
substr(first_name,1),
substr(first_name,1,3),
substr(first_name,-3)
 from actor;
 
--  INSTR -->extract data position

select first_name,
instr(first_name , 'E')
from actor;
 
select first_name,
char_length(first_name),
char(first_name)
from actor;

-- (char--->read as byte
-- char_lenth --->read characters(size))

-- --length() --->return the length of a string in bytes

-- dual table--->dummy table present in sql

select 'hey' from dual;

select length('𭨡'),char_length('𭨡');

select amount from payment;

select first_name,
lpad(first_name , 3,'$')from actor;

select ' hey   ',
trim(' hey  ') from dual;    -- wide space htane k liye

select ' hey  ',
trim(leading 'z' from 'zzzhezzz'),
trim(trailing 'z' from 'zzzhezzz')
from dual;

-- replace
select first_name , replace(first_name, 'E' ,'X')
from actor
use sakila;

create table employees(id int primary key auto_increment,
dept varchar(20),
salary int);

insert into employees(dept , salary)values("hr",200),
("hr",300),("hr",100),
("marketing",70),("marketing",50),("marketing",200),("marketing",400),("marketing",200),
("marketing",600);

insert into employees(dept , salary)values("dsa",150),("dsa",120),("dsa",40),("dsa",90),
("dsa",500);

select * ,(select sum(salary) from employees)from employees;


select *,
sum(salary) over(),
max(salary) over(),
avg(salary) over()
from employees;

-- windows partition by

select * , sum(salary) over(),
sum(salary) over(partition by dept)
from employees;

select * ,
sum(salary) over(order by salary desc) 
from employees;

-- dept p window bnai phir usp order by krk usp cumulative sum aplly kiya
select * ,
sum(salary) over(partition by dept order by salary desc) 
from employees;

-- avg salary of each department ,running avg of each salary
select * , avg(salary) over(partition by dept) ,
avg(salary) over (order by dept)
from employees;

-- FUNCTION OF WINDOW
-- 1.ROW NUMBER

SELECT *,
row_number() over(partition by dept order by salary)
from employees;

-- 2.ranking

SELECT * , RANK() OVER(order by salary)from employees;

-- 3.dense rank
SELECT * , RANK() OVER(order by salary),
dense_rank() over(order by salary) from employees;

select *,
rank() over(partition by dept order by salary)
from employees;

-- 1.LAG
select * ,
lag(salary) over (order by id)
from employees;

-- 2.LEAD
select * ,
lead(salary) over (order by id)
from employees;

-- compared with 2 nd values
select * ,
lead(salary,2) over (order by id)
from employees;


-- 3.NTILE
select * ,
ntile(2) over (order by salary)
from employees;



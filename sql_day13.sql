-- CORRELATED SUBQUEY

use regex1;

create table emp(eid int primary key , name varchar(20));
insert into emp values(1,'aman'),(2,'shubham'),(3,'abc');

create table emp_family(eid int , name varchar(20), father varchar(20));
insert into emp_family values(1,'aman','raj'),(2,'shubham','kamal'),(3,'abc','aman'),
(4,'ujjwal','kaluram');
insert into emp_family values(3,'abc','abc');

select * from emp_family;

select * from emp
where name in (select father from emp_family where emp_family.eid = emp.eid);


create table emp123(eid int primary key , fname varchar(20),salary int, department_id int );
insert into emp123 values(1,'tushar',900,10),(2,'shubham',100,10),(3,'aman',50,10),
(4,'sakshi',200,11),(5,'naina',300,11);

insert into emp123 values(6,'isha',350,12);

select * from emp123;


select * from emp123 where salary >(
select avg(salary) from emp123 as e
where emp123.department_id = e.department_id
group by e.department_id);

-- MULTI COLUMN SUBQUERY
select * from emp123 where (department_id , salary) in 
    (select e.department_id,avg(salary) from emp123 as e
         group by e.department_id);

create table order1(order_id int primary key , item varchar(25));
insert into order1 values(1,'pen'),(2,'pencil');
create table product1(product_id int primary key , pro varchar(20));
insert into product1 values(3,'jug'),(4,'glass');

select order_id from order1 
where exists (select product_id from product1
where product_id = order_id);

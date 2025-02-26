-- FOR CORRELATED ( READ JOINS )

-- JOINS --->
--        EK YA EK SE JAYDA TABLES KO JODNE K LIYE 
--        FOR CINSESTENCY DATA
--        NO NULL VALUES

-- null values and empty string are diff things
-- null means no existence ,koi data hi nhi toh kutch operation anhi hoga


USE SAKILA;
select * from address;

--    * -->generally we consider first column
select count(*) from address;

-- first column is generally a primay key (which has unique values and no null value exists)

-- FOREIGN KEY :
--               IT IS AN ATRRIBUTE JO EK RELATIONSHIP DEFINE KARTI HAI EK SE JAYDA TABLE K BICH ME


-- TWO TYPES OF RELATION : 1.ONE TO ONE , 2.MANY -TO-ONE

create database test1;
use test1;

create table product(pid int,
					name varchar(20),
                    price int);

insert into product values 
(10,'tv',100),
(20,'apple',200),
(30,'mobile',300),
(40,'shoe',1500)
;

select * from product;

create table orders(oid varchar(20),
                    city varchar(20),
                    product_id int);
                    
insert into orders values
('A1012' , 'JAIPUR', 10),
('B2012' , 'GOA', 20),
('C3012' , 'JAPAN', 30),
('D4012' , 'UK', 60)
;

SELECT * FROM ORDERS;

SELECT PID , NAME ,PRICE ,city 
FROM PRODUCT join orders;    -- it is a type of cross join ---join where we didn't define a condition
						     -- then the first row of first table will be match with the each row of second table
                             --  and second table with another table
                             
-- cross join /cartesian join
-- formula = if first table has m records and second table has n records then the formula 
--           will be m*n
-- disadvantage--> data bhut bada aata hai
                             
SELECT PID , NAME ,PRICE ,city 
FROM PRODUCT as p join orders as o
where pid = product_id;

-- OR
-- SIMILAR TO ABOVE , BUT A GOOD HABIT TO WRITE TABLE NAME WITH THE COLUMN NAMES

 SELECT p.PID , p.NAME ,p.PRICE ,o.city 
FROM PRODUCT as p join orders as o
where p.pid = o.product_id;

-- OR
-- BETTER WAY
-- EQUI JOIN -->BCOX INNER JOIN KA OLD SYNTAX HAI Y

SELECT p.PID , p.NAME ,p.PRICE ,o.city 
FROM PRODUCT as p INNER join orders as o
where p.pid = o.product_id;

-- IN INNER JOIN WE CAN USE ON INSTEAD OF WHERE 
-- ON AND WHERE ARE EXACTLY SIMILAR

-- NEW SYNTAX (INNER JOIN)

SELECT p.PID , p.NAME ,p.PRICE ,o.city 
FROM PRODUCT as p join orders as o
ON p.pid = o.product_id;

-- INNER AND OR ARE KEYWORDS

-- THIS WAS A INNER JOIN -->JHA P COMMON ELEMENTS HI NIKALE DONO TABLE K

-- VERSIONS OF JOIN

-- LEFT JOIN
-- LEFT TABLE KA SARA DATA MILEGA AGER DATA MATCH KRE YA NA KRE RIGHT TABLE K 

SELECT p.PID , p.NAME ,p.PRICE ,o.city 
FROM PRODUCT as p LEFT join orders as o
ON p.pid = o.product_id;

-- RIGHT JOIN
-- RIGHT TABLE KA SARA DATA MILEGA AGER DATA MATCH KRE YA NA KRE LEFT TABLE K 

SELECT p.PID , p.NAME ,p.PRICE ,o.city 
FROM PRODUCT as p RIGHT join orders as o
ON p.pid = o.product_id;

-- NON-EQUI JOIN 
-- FOR CREATINg CONFUSION WE DIDN'T DEFINE ANY JOIN NAME
-- here we didn't define any join name for using both the tables
-- here we use operators(<,>,<=,>=,=) to join both the table (no use of inner , on ,etc)

select pid,city
from product , orders
where pid = product_id;

insert into orders values('E2132','JK',10),('F213','MH',30);

SELECT p.PID , p.NAME ,p.PRICE ,o.oid,o.city 
FROM PRODUCT as p INNER join orders as o
ON p.pid = o.product_id;

SELECT p.PID , p.NAME ,p.PRICE ,o.city 
FROM PRODUCT as p left join orders as o
ON p.pid = o.product_id;

SELECT p.PID , p.NAME ,p.PRICE ,o.city 
FROM PRODUCT as p right join orders as o
ON p.pid = o.product_id;

-- NATURAL JOIN

-- bekwas join
-- if columns name is different in both tables ,it will act like cross join
-- if column name is same it will act like inner join
-- no where we use in it

SELECT p.PID , p.NAME ,p.PRICE ,o.city 
FROM PRODUCT as p natural join orders as o;

alter table orders change product_id pid int;

select * from orders;

desc orders;

SELECT p.PID , p.NAME ,p.PRICE ,o.city 
FROM PRODUCT as p natural join orders as o;

alter table orders change city name varchar(20);

SELECT p.PID , p.NAME ,p.PRICE ,o.name
FROM PRODUCT as p natural join orders as o; -- empty table
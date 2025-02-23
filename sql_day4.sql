-- MULTI ROW FUNCTIONS

-- 1. AGGREGATE FUNCTIONS---> ARE THOSE FUNCTIONS WHICH HELP IN SOME FORM OF CALCULATIONS
-- ------>IT TAKES DATA FROM MULTIPLE ROWS AND GIVES ANS IN SINGLE RO
-- ----->aggregate function p where clause nahi lg skta

-- SUM
-- COUNT
-- AVERAGE

USE SAkila;
SELECT sum(amount) from payment;
SELECT count(amount) from payment;
select sum(amount)/count(amount) from payment;
-- or
select avg(amount) from payment;

-- unique amount dekhna hai
select distinct(amount) from payment;

-- unique amount ka count dekhna hai
select count(distinct(amount)) from payment;

-- compare 
select count(distinct(amount)) , count(amount) from payment;

-- koi no. kitne baar aaya
select count(amount) from payment
where amount=0.99;

-- GROUP BY (COLLECTING SMILAR TYPE OF VALUES)
      -- (GROUP-SIMILAR VALUES KO IKTA KRNA
	-- GROUP BY-EK CLAUSE HAI JISKE HELP SE MULTIPLE SIMILAR VALUES KO EK SATH IKTA KAR DETA H
    -- jis collumn by group by krte ho vhi column select me use ho skta hai or you can not use other columns

SELECT amount,count(amount) from payment group by amount;

SELECT amount,count(amount) , sum(amount) ,avg(amount) from payment group by amount;

-- QUES: calculate total amount of every month uniquely
select month(payment_date),sum(amount) 
from payment
group by month(payment_date);

-- QUES:get the total amount , avg amount spend by each customer
select customer_id , sum(amount) , avg(amount)
from payment
group by customer_id;

-- QUES : get the total amount and the max amd min amount for each staff id
-- QUES: get the total no. of paymnets done by each staff
-- QUES : get the total amount , total no. entries , avg and min amount by each customer where the amount value > 2$ and paymnet_id > 10    

use sakila;

select amount , sum(amount)
from payment
where amount!=0.99
group by amount;

-- HAVING CLAUSE --> IT IS ALWAYS USED WITH GROUP BY ,IF GROUP BY NOT PRESENT WE CAN NOT USE HAVING CLAUSE.
-- IT IS USED TO FILTER UPON GROUP BY COLUMNS

select amount , sum(amount)
from payment
where amount!=0.99
group by amount
having sum(amount) > 8000;

select amount , sum(amount)
from payment
group by amount
having amount!=0.99 ;     -- we can use having with normal columns also but this is of no use bcoz humne puri calculations kar li phir hum cond lga rhe hai


-- ALIAS-->GIVING A NICKNAME TO COLUMN

select amount , amount*10 from payment;

-- USING ALIAS
select amount , amount*10 as new_amount from payment;
-- or
select amount , amount*10 as 'new_amount' from payment;

-- ORDER BY

select * from payment
order by amount;

-- abi amount k acc sorting hue i want ki rental id asc oreder me sort ho amount desc k baad
select * from payment
order by amount desc,
rental_id;


-- FLOW CONTROL STATEMENTS

select amount ,
if(amount = 0.99 ,'Correct' , 'Incorrect')
from payment;

-- more than one cond 
select amount ,
if(amount = 0.99 ,'Correct' , 
if (amount=2.99 , 'yes',
'Incorrect'))
from payment;


-- CASE-STATEMENT

-- select col ,
-- 	case
-- 		when condition then statement
--         when condition then statement
-- 	end

select amount,
case
	when amount =0.99 then "value is 0.99"
end as "condition"
from payment;

-- to avoid null values
select amount,
case
	when amount =0.99 then "value is 0.99"
    when amount =2.99 then "value is 0.99"
    else amount
end as "condition"
from payment;

-- QUES:take paymnet table if the count of paymnet done for each amount > 10000 then print we hav amount greater 10000 else print les sthan 100000

SELECT amount,
    CASE 
        WHEN sum(amount) > 10000 THEN 'We have amount greater than 10000' 
        ELSE 'Less than 10000' 
    END AS result
FROM payment
group by amount;

-- or
SELECT 
    CASE 
        WHEN COUNT(*) > 10000 THEN 'We have amount greater than 10000' 
        ELSE 'Less than 10000' 
    END AS result
FROM payment
GROUP BY amount;
-- The COUNT(*) function counts the number of payments for each unique amount in the payment table.


-- QUES:if the amount > 1$ print greater than 1$ ,if the amount > 3$ print greater than 3$,if the amount > 7$ print greater than 7$,otherwise print amount is less than 1$

-- SUBQUERY--->
-- QUERY WITHIN A QUEARY
-- KOI QUERY KA RESULT KISE DUSRI QUERY K RESULT P DEPEND HAI TOH USE BOLTE HAI SUB-QUERY

-- ex  :  i need that amount whose payment_id = 3
select * from payment 
where amount = (select amount
				from payment where payment_id = 3);
use sakila;

-- QUES --muje kaise logo ka name chahiye jinka name actor id 2 k equal ho
select * from actor where 
first_name =(select first_name from actor where actor_id =2);

select * from payment where 
amount > (select amount from payment where rental_id=1185);

-- QUES : GET THOSE PAYMENTS WHERE THE MONTH MATCHES WITH THE MONTH OF PAYMENT _ID =3

SELECT * FROM payment
WHERE MONTH(payment_date) = MONTH(
    (SELECT payment_date FROM payment WHERE payment_id = 3)
);

-- 	QUES :GET THOSE AMOUNT WHERE THE TOTAL NO. OF PAYMENTS FOR THE AMOUNT SHOULD BE > TOTAL GREATER OF AMOUNT 0.99

select amount,count(amount) from payment 
group by amount
having count(amount)>(select count(amount) from payment where amount=0.99);

-- ques :GET EACH CUSTOMER ID AND THE TOTAL AMOUNT SPEND WHER THE TOTAL AMOUNT SHOULD BE GREATER THAN
-- THEN TOTAL AMOUNT SPEND BY CUSTOMER_ID = 9

SELECT CUSTOMER_ID , SUM(AMOUNT) FROM PAYMENT 
GROUP BY CUSTOMER_ID 
HAVING SUM(AMOUNT) > (SELECT SUM(AMOUNT) FROM PAYMENT WHERE CUSTOMER_ID =9);


-- MULTI ROW SUBQUERY--->
-- AISE SUBQUERY JO EK SE JAYDA ROW RETURN KREGI 
-- FOR MULTI ROW SUBQUERY ---> CAN NOT USE OPERATORS(<,>,=,ETC)

-- MULTI ROW SUBQUERY -----> WE USE 3 NEW OPERATORS
-- 1. IN OPERTAOR

select * from payment
where amount in (select amount from payment
                 where payment_id in (1,3));
                 
-- 2.ANY
--      =any is smiliar to in operator
--      we can >,<,= with any 

select * from payment
where amount =any (select amount from payment
                 where payment_id in (1,3));
 
 --    >any means greater than the minimum value of your subquery
select * from payment
where amount >any (select amount from payment
                 where payment_id in (1,3));

 --    <any means greater than the maximum value of your subquery                 
select * from payment
where amount <any (select amount from payment
                 where payment_id in (1,3));

-- 3.ALL OPERATOR

--   >all means greater than the maximum value of your subquery 
select * from payment
where amount >ALL (select amount from payment
                 where payment_id in (1,3));
                 
  
  --   <all means greater than the mINIMUM value of your subquery 
select * from payment
where amount <ALL (select amount from payment
                 where payment_id in (1,3));
                 

-- READ                 
-- WHAT IS CORELATED SUBQUERY?
-- WHAT IS DATABSE
-- WHAT IS DBMS ?
-- TYPES OF DBMS WITH EXAMPLE
-- DBMS VS RDBMS
-- WHERE AND HAVING CLAUSE DIFFERENCE
-- WHAT IS SQL AND ITS TYPES?
-- KEYS(PRIMARY , SUPER KEY , CANDIDATE KEY)



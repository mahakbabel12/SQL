use sakila;

-- TWO CATEGORIE OF FUNCTIONS-
-- 1.SINGLE ROW
-- 2.MULTI ROW

-- 1.SINGLE ROW CATEGORY FUNCTIONS  -->HAR EK ROW P APPLY HOGA HAR EK ROW K LIYE OUTPUT DEGA

select first_name ,substr(first_name,2)
from actor;

-- NUMERIC FUN--->
-- ROUND , TRUNCATE ,MOD,POW

SELECT 12+3 FROM DUAL;

select round(13.5) from dual;

-- round the decimal value
select round(13.5) ,round(12.485,2) from dual;

-- round off ones means 812.4->2 no. ki place ,tens means 1 h vo place ,8is at hundeds place
select round(846.41,-1) from dual;

select round(846.41,-2) from dual;

select round(873.41,-3) from dual;

select round(273.41,-3) from dual;

select round(273.41,3) from dual;
select round(273.41,1) from dual;

-- TRUNCATE
-- FOR DECIMAL VALUE EXTRACTION IT DOESN'T ROUND OFF VALUE

select round(273.41,1) from dual;
select round(273.457,2) from dual;
select round(273.4167,3) from dual;

-- MOD
-- --REMAINDER BTATA HAI 

select MOD(23,3) from dual;
select MOD(20,2) from dual;
-- or
select MOD(20,2) , 20%2 from dual;


-- POW
-- 2**3-->2*2*2=8

select pow(2,3) from dual;
select pow(16,2) from dual;


-- DATE FUNCTIONS

-- CURRENT DATE
select curdate() from dual;
-- or
select current_date() from dual;

-- CURRENT TIME
select CURTIME() from dual;
-- or
select current_time() from dual;

-- SHOWS BOTH THINGS CURRENT DATE AND CURRENT TIME
select NOW() from dual;

-- SHOWS BOTH THINGS CURRENT DATE AND CURRENT TIME
select current_timestamp() from dual;

-- aaj ki date me 1 din add kar diya means next day ki date 
select adddate(curdate(),1)from dual; 

-- 2 din add kar diya
select adddate(curdate(),2)from dual; 

-- current date me se 1 din kam means yesterday ki date
select adddate(curdate(),-1)from dual; 

-- ek mahina aage ka bhi add kar skte hai (1 month add ho gaya)
select adddate(curdate(),interval 1 month)from dual; 

-- add 1 year
select adddate(curdate(),interval 1 year)from dual; 

-- add 1 week
select adddate(curdate(),interval 1 week)from dual; 
-- ek week kam
select adddate(curdate(),interval -1 week)from dual; 

-- 2 dates k bich me difference niakla
select 
datediff(curdate() , 
	adddate(curdate(),interval -1 week) );
 
--  LAST DAY
select now(),last_day(now())from dual;

-- LAST MONTH and year
select month(now()),last_day(now())from dual;

-- MONTH
select month(now())from dual;

-- YEAR
select year(now())from dual;

-- DATEFORMAT()--->KISE FORMAT K ACCORDING VALUES KO NIKALANA

-- %a--->konsa day hai (week day)
select date_format(now(),'%a') from dual;

-- %b ---> konsa month hai

-- short name of month
select date_format(now(),'%b') from dual;
 
 -- full name of month
select date_format(now(),'%M') from dual;

select date_format(now(),'current month is :%M') from dual;

-- hour
select date_format(now(),'%l') from dual;

-- DAY OF YEAR (1-365)
select date_format(now(),'%j') from dual;

-- AM PM
select date_format(now(),'%p') from dual;

-- seconds
select date_format(now(),'%s') from dual;

-- Minutes
select date_format(now(),'%i') from dual;

-- HOUR
select date_format(now(),'%h') from dual;

-- DATE
select date_format(now(),'%d') from dual;

-- YEAR
select date_format(now(),'%Y') from dual;

-- MONTH(in numbers)
select date_format(now(),'%m') from dual;

-- YYYY-MM-DD
-- CONVERTING STRING DATE TO A SPECIFIC DATE FORMAT
select CURDATE(),str_to_date('20 2025 02', '%d %Y %m') from dual;

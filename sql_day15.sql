-- TCL ---> TRASACTION CONTROL LANGUAGE
-- TCL -> COMMIT , ROLLBACK ,SAVEPOINT

SELECT @@autocommit;    #by default value is 

SET autocommit = 0;
SELECT @@autocommit;

use regex1;
create table yash(id int , fname varchar(20));
insert into yash values(10,"shubham");
select * from yash;
commit;              #to save the changes permantely in database

insert into yash values(11,"aman");
commit;
rollback;
select * from yash;

insert into yash values(12,"aman");
insert into yash values(13,"ram");
update yash set fname='uu';
select * from yash;
savepoint yash_raj_sv;
insert into yash values(14,'pp');
rollback to yash_raj_sv;
select * from yash;


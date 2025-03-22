-- INDEX
USE regex1;

create table users(id int , fname varchar(20));
insert into users values(10,'tushar'),(11,'aman'),(12,'naina'),
(13,'raj'),(14,'shubham'),(15,'om');

explain select * from users 
where id =11;

drop table users;

create table users(id int primary key, fname varchar(20));
insert into users values(10,'tushar'),(11,'aman'),(12,'naina'),
(13,'raj'),(14,'shubham'),(15,'om'),(16,'tushar');

explain select * from users 
where id =11;

show indexes from users;

explain select * from users 
where fname = 'om';

create index user_f on users(fname);
show indexes from users;

explain select * from users 
where fname = 'tushar';

drop index `primary` on users;

drop index user_f on users;
show indexes from users;

create table user1 (id int , name varchar(12),last_name varchar(12));
insert into user1 values(1,'mahak','babel'),(2,'nikita','jain'),
(3,'poonam','chipa'),(4,'pooja','agal');

explain select * from user1
where name = 'mahak' and last_name='babel';

create index userr_f on user1(name , last_name);

explain select * from user1
where name = 'mahak' and last_name='babel';

explain select * from user1
where last_name='babel' and name='mahak';

show indexes from user1;

CREATE TABLE user2 (
    id INT,
    email VARCHAR(255)
);
INSERT INTO user2 (email) VALUES
('john.doe@gmail.com'),
('jane.smith@yahoo.com'),
('peter.parker@marvel.com'),
('tony.stark@starkindustries.com'),
('bruce.wayne@wayneenterprises.com');

CREATE INDEX idx_email_prefix ON user2(email(10));

SELECT * FROM user2  
WHERE email LIKE 'john.doe%';  

EXPLAIN SELECT * FROM user2 WHERE email LIKE 'john.doe%';




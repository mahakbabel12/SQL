use employees;

select * from employees;
select * from departments;
select * from salaries;
select * from titles;
select * from dept_emp;

select * from salaries
where salary <all (select salary from salaries where emp_no = 10003);

select * from employees;
select * from titles;

desc employees;
desc titles;

select e.emp_no , e.first_name,e.last_name,t.title
from employees as e join titles as t
on e.emp_no = t.emp_no
where t.title = 'Manager' and e.emp_no in (select e.emp_no 
from employees as e join titles as t where title <> 'manager');




select e.emp_no , e.first_name , e.last_name ,e.hire_date , t.title
 from employees as e join titles as t
on e.emp_no = t.emp_no
where t.title = 'Assistant Engineer' and 
hire_date <any (select e.hire_date 
 from employees as e join titles as t
 on e.emp_no = t.emp_no 
 where t.title = 'manager');


select year(hire_date) from employees;

select e.emp_no ,year(e.hire_date) , t.title
 from employees as e join titles as t
on e.emp_no = t.emp_no
where title = 'Manager' and (e.emp_no , year(hire_date)) in (select e.emp_no ,year(e.hire_date)
from employees as e join titles as t where t.title <> 'manager');
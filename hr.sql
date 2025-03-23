set serveroutput on;
begin 
    dbms_output.put_line('hello world');
end;

declare 
    msg varchar(30) := 'hello world by tushar';
begin
     dbms_output.put_line(msg);
end;


declare 
    msg varchar(30) := 'hello world by tushar';
begin
     dbms_output.put_line(msg || ' ' || '###');
end;
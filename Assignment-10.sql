-- Assignment 10
-- Q1
create table emp(eno int primary key, ename varchar(200), bp number, da number, hra number, total number);
INSERT INTO emp (eno, ename, bp, da, hra) VALUES (101, 'Alice', 30000, 5000, 2000);
INSERT INTO emp (eno, ename, bp, da, hra) VALUES (102, 'Bob', 35000, 6000, 2500);
INSERT INTO emp (eno, ename, bp, da, hra) VALUES (103, 'Charlie', 28000, 4500, 1800);
INSERT INTO emp (eno, ename, bp, da, hra) VALUES (104, 'Diana', 40000, 7000, 3000);
INSERT INTO emp (eno, ename, bp, da, hra) VALUES (105, 'Ethan', 32000, 5200, 2200);
select * from emp;

create or replace procedure p1 (n in number, tot out number)
is
begin
    select bp+da+hra into tot from emp where ENO=n;
    end p1;
/

DECLARE
total1 emp.TOTAL%TYPE;
BEGIN
    for rec in (select eno from emp) loop
    p1(rec.eno,total1);
    update emp set total=total1 where eno=rec.eno;

    dbms_output.put_line('The total is: '||total1);
    end loop;
    end;
/

-- Q2
DECLARE
    temp number;
    fact number;
    function f1(n in number, result out number)
    return number;
    is
    BEGIN
        temp:=1;
        for i in 1..n loop
        temp:=temp*i;
        end loop;
        dbms_output.put_line('The factorial is: '||temp);
        return temp;
        end f1;
        result:=temp;

begin
    fact:=f1(5,result);
    

-- Q3
create or replace procedure c1(n in number)
is
begin 
    if n>0 THEN
    dbms_output.put_line('Number is positive: '||n);
    elsif n<0 then 
    dbms_output.put_line('Number is negative: '||n);
    else
    dbms_output.put_line('Its zero: '||n);
    end if;
    end c1;
/

declare 
n1 number:='&entern';
begin
    c1(n1);
    end;
/

-- Q4
create or replace function f1(n in number)
return number
is 
result number;
begin
    result:=n*(n+1)/2;
    return result;
    end;
/

select f1(10) from dual;

-- Q5
DECLARE
    total1 number:=0;
    total2 number:=0;
    procedure p1(a in number, b in number, c in number, d in number)
    is
        i number;
        j number;
        sum1 number:=0;
        sum2 number:=0;
        count1 number:=0;
        count2 number:=0;
    begin
        for i in a..b loop
        sum1:=sum1+i;
        count1:=count1+1;
        end loop;
        total1:=sum1/count1;
        for j in c..d loop
        sum2:=sum2+j;
        count2:=count2+1;
        end loop;
        total2:=sum2/count2;
        dbms_output.put_line('The sum of two avg is: '||(total1+total2));
    end p1;
BEGIN
    p1(5,10,25,35);
    end;
/

-- Q6
DECLARE
    r varchar(200);
  FUNCTION print_message(counter NUMBER) 
  RETURN NUMBER 
  IS
  BEGIN
    IF counter > 10 THEN
      RETURN 0;
    END IF;
    DBMS_OUTPUT.PUT_LINE('Hello World');
    RETURN print_message(counter + 1);
  END;

BEGIN
    r:=print_message(1);
END;


-- Q7
create table student(rollno number primary key, name varchar(30), subid number, mark1 number, mark2 number, mark3 number);
INSERT INTO student (rollno, name, subid, mark1, mark2, mark3)
VALUES (1, 'Alice', 101, 85, 90, 88);

INSERT INTO student (rollno, name, subid, mark1, mark2, mark3)
VALUES (2, 'Bob', 102, 75, 80, 78);

INSERT INTO student (rollno, name, subid, mark1, mark2, mark3)
VALUES (3, 'Charlie', 103, 95, 92, 96);

INSERT INTO student (rollno, name, subid, mark1, mark2, mark3)
VALUES (4, 'David', 104, 60, 65, 63);

INSERT INTO student (rollno, name, subid, mark1, mark2, mark3)
VALUES (5, 'Eve', 105, 70, 72, 68);

INSERT INTO student (rollno, name, subid, mark1, mark2, mark3)
VALUES (6, 'Frank', 106, 80, 85, 83);

create or replace procedure p1(r in number, tot out number)
is
begin
    select mark1+mark2+mark3 into tot from student where ROLLNO=r;
    end p1;
/
DECLARE
r1 student.
begin
    p1(r1,t1);
    DBMS_OUTPUT.PUT_LINE('The sum is: '||t1);
    end;
/

-- Q8
create or replace procedure p1(r in number, tot out number)
is
begin
    select mark1+mark2+mark3 into tot from student where ROLLNO=r;
    end p1;
/

DECLARE
    avg1 number;
    res number;
    function fun2(r in number)
    return NUMBER
    is 
    tot number;
    avg2 number;
    begin
        p1(r,tot);
        return tot;
        avg2:=tot/3;
        avg1:=avg2;
        end;
BEGIN
    res:=fun2(5);
    dbms_output.put_line('The average is: '||res);
    end;
/

-- Q9
create or replace function fun3(m in number)
return number
is
output number;
begin
    select greatest(mark1,mark2,mark3) into output from student where ROLLNO=m;
    return output;
    end;
/
DECLARE
r number;
BEGIN
    for rec in (select rollnum from student) loop
    r:=FUN3(rec.rollno);
    dbms_output.put_line('Highest marks is: '||r);
    end loop;
    EXCEPTION
    when no_data_found then
    r:=0;
    end;
/
-- select fun3(5) from dual;

-- Q10
create or replace procedure p1(r in number, tot out number)
is
begin
    select mark1+mark2+mark3 into tot from student where ROLLNO=r;
    end p1;
/

DECLARE
    r1 number:='&enternum';
    mark1 number;
    mark2 number;
    mark3 number;
    total number;
procedure p2(r1 number)
is
    tot number;
begin
    p1(r1,tot);
    select mark1,mark2,mark3 into mark1,mark2,mark3 from student where ROLLNO=r1;
    total:=tot;
    end p2;
BEGIN
    p2(r1);
    dbms_output.put_line('Particular marks are: '||mark1|| ','||mark2|| ','||mark3);
    dbms_output.put_line('Total marks is: '||total);
    end;
/
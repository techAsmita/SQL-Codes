-- Assignment 12
-- Q1
-- statement level trigger fires once for whole statment.
-- row level trigger fires for each row.
-- Create the DEPT table
CREATE TABLE DEPT (
    DEPTNO INT PRIMARY KEY,
    DNAME VARCHAR(50)
);

-- Create the EMP table
CREATE TABLE EMP (
    ENO INT PRIMARY KEY,
    ENAME VARCHAR(50),
    JOB VARCHAR(50),
    AGE INT,
    SALARY DECIMAL(10, 2),
    COMMISSION DECIMAL(10, 2),
    DEPTNO INT,
    FOREIGN KEY (DEPTNO) REFERENCES DEPT(DEPTNO)
);

-- Insert 5 records into DEPT
INSERT INTO DEPT (DEPTNO, DNAME) VALUES
(10, 'Accounting'),
(20, 'Research'),
(30, 'Sales'),
(40, 'Operations'),
(50, 'IT Support');

-- Insert 5 records into EMP
INSERT INTO EMP (ENO, ENAME, JOB, AGE, SALARY, COMMISSION, DEPTNO) VALUES
(1001, 'Alice', 'Manager', 35, 75000, 5000, 10),
(1002, 'Bob', 'Analyst', 28, 58000, 3000, 20),
(1003, 'Charlie', 'Salesman', 30, 45000, 7000, 30),
(1004, 'Diana', 'Clerk', 25, 32000, 1000, 40),
(1005, 'Ethan', 'Tech Support', 29, 40000, 2000, 50);

create or replace trigger emp_old
after delete on emp 
for each ROW
begin
    if deleting then
    insert into emp_old values(:old.eno, :old.ename, :old.job, :old.age, :old.salary, :old.commission, :old.deptno);
    end if;
end;

create table emp_old(ENO int primary key, ENAME varchar(200), JOB varchar(200), AGE int, SALARY number, COMMISSION number, DEPTNO number);
delete from emp where age <30;
select * from emp_old;

-- Q2
create or replace trigger check1
before insert or update on emp
for each row
begin
    if :new.age<25 THEN
    raise_application_error(-20001,'No person should be below 25');
    end if;
end;

insert into emp values(1006, 'Alice', 'Manager', 24, 75000, 5000, 10);

-- Q3
create or replace trigger t10
after update on emp
for each row
begin
    if :new.salary<:old.salary then
    raise_application_error(-20001,'Salary shouldnt be less than old sal');
    end if;
end;

update emp set salary = 46000 where eno=1002;

-- Q4
-- statment level trigger
create or replace trigger state1
after insert on emp
begin
    insert into emp_old values ('An insert happened on employees table', SYSDATE);
END;

-- for statement level trigger no for each row is required.
CREATE OR REPLACE TRIGGER before_delete_product
BEFORE DELETE ON product
BEGIN
    INSERT INTO audit_log (message, log_time)
    VALUES ('Products are being deleted', SYSDATE);
END;

-- Q5
create or replace trigger change1
before insert or update on emp
for each row
begin
    :new.ename:=UPPER(:new.ename);
end;

insert into emp values(1007, 'bhavya', 'Manager', 24, 75000, 5000, 10);

-- Q6
create or replace trigger change2
after update on emp
for each row
begin
    if updating then
    DBMS_OUTPUT.put_line('Old name: '||:old.ename|| ', New name: '||:new.ename);
    end if;
    end;

update emp set ename='Akshita' where eno=1001;

-- Q7
create or replace trigger check3
before insert or update on emp
for each row
begin
    if :new.salary<:old.commission then
    raise_application_error(-20001,'New salary cant be greater than commision.');
    end if;
end;

update emp set salary=400 where eno=1005;

-- Q8
create or replace trigger check4
before insert or update on emp
for each row
begin
    if(rtrim(to_char(sysdate,'day')))='sunday' then
    raise_application_error(-20001,'No operation can be performed.');
    end if;
end;

-- Q9
create or replace trigger p1
before insert on emp1
for each ROW
declare
e emp1.empno%type;
begin
    if(:new.empno is null) then
    raise_application_error(-20002,'Primary key cant be null.');
end if;
    select empno into e from emp1 where empno=:new.empno;
    raise_application_error(-20002,'Primary cant be repeated.');
exception 
when no_data_found then
null;
end;

-- Q10
CREATE OR REPLACE TRIGGER t5
BEFORE INSERT ON emp1
FOR EACH ROW
DECLARE 
    d dept.DEPTNO%TYPE;
BEGIN
    SELECT deptno 
    INTO d 
    FROM dept 
    WHERE deptno = :NEW.deptno;
    -- If found, do nothing. If not found, raise error automatically.
EXCEPTION 
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20004, 'Foreign key violated: Department not found.');
END;
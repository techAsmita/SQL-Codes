-- Assignment 11
-- Q1
-- Create the table
CREATE TABLE Students (
    Rollno INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    mark1 INT,
    mark2 INT,
    mark3 INT,
    total INT
);

-- Insert 6 records: some ages > 25, some <= 25
INSERT INTO Students (Rollno, name, age, mark1, mark2, mark3) VALUES
(1, 'Aarav', 22, 85, 90, 88),   -- age <= 25
(2, 'Isha', 27, 78, 82, 80),    -- age > 25
(3, 'Rohan', 23, 92, 95, 94),   -- age <= 25
(4, 'Meera', 29, 70, 75, 80),   -- age > 25
(5, 'Karan', 21, 88, 85, 82),   -- age <= 25
(6, 'Sneha', 28, 80, 83, 85);   -- age > 25
CREATE TABLE Studentminor(
    Rollno INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    mark1 INT,
    mark2 INT,
    mark3 INT,
    total INT
);

DECLARE 
cursor c1 is select * from students where age <25;
r1 students%rowtype;
begin
    open c1;
    loop
        fetch c1 into r1.Rollno,r1.name,r1.age,r1.mark1,r1.mark2,r1.mark3,r1.total;
        exit when c1%notfound;

        insert into STUDENTMINOR(Rollno, name, age, mark1, mark2, mark3, total) values (r1.Rollno,r1.name,r1.age,r1.mark1,r1.mark2,r1.mark3,r1.total);

        DELETE FROM Student WHERE Rollno = r1.Rollno;
   
   END LOOP;
   
   CLOSE c1;
END;
/
select * from STUDENTMINOR;
select * from students;

-- Q2
DECLARE
cursor c2 is select * from students;
r1 students%rowtype;
begin
    open c2;
    loop
        fetch c2 into r1.Rollno,r1.name,r1.age,r1.mark1,r1.mark2,r1.mark3,r1.total;
        exit when c2%notfound;
        r1.total:=r1.mark1+r1.mark2+r1.mark3;
        -- to get all the marks.
        dbms_output.put_line('Name: '||r1.name|| ', Total: '||r1.total);
        update students set total=r1.total where rollno=r1.rollno;
        end loop;
    close c2;
end;

-- Q3
declare 
cursor c3 is select * from students;
r1 students%rowtype;
begin
    open c3;
    loop
        fetch c3 into r1.Rollno,r1.name,r1.age,r1.mark1,r1.mark2,r1.mark3,r1.total;
        exit when c3%notfound;
        if r1.total>90 then
            dbms_output.put_line('The students whose total marks above 90 are: '||c3%rowcount);
        end if;
        dbms_output.put_line('Name: '||r1.name|| ', Rollno: '||r1.rollno);
        end loop;
    close c3;
end;

-- Q4
DECLARE
    CURSOR c5 IS SELECT * FROM students;
    highest NUMBER := -9999;
    lowest NUMBER := 9999;
    highest_name students.name%TYPE;
    lowest_name students.name%TYPE;
    highest_rollno students.rollno%TYPE;
    lowest_rollno students.rollno%TYPE;
BEGIN
    FOR r1 IN c5 LOOP
        IF r1.total > highest THEN
            highest := r1.total;
            highest_name := r1.name;
            highest_rollno := r1.rollno;
        END IF;
        
        IF r1.total < lowest THEN
            lowest := r1.total;
            lowest_name := r1.name;
            lowest_rollno := r1.rollno;
        END IF;
    END LOOP;
    dbms_output.put_line('Name: ' || highest_name || ', Rollno: ' || highest_rollno || ', Highest Total: ' || highest);
    dbms_output.put_line('Name: ' || lowest_name || ', Rollno: ' || lowest_rollno || ', Lowest Total: ' || lowest);
END;
select * from students;
-- in for cursor we don't need to write exit when.
    
-- Q5
DECLARE
cursor c1 is select mark1,mark2,mark3 from students;
r1 students%rowtype;
tot number;
avg1 number;
BEGIN
    open c1;
    loop
    fetch c1 into r1.mark1,r1.mark2,r1.mark3;
    exit when c1%notfound;
    tot:=r1.mark1+r1.mark2+r1.mark3;
    avg1:=tot/3;
    dbms_output.put_line('Avg marks of students : '||avg1);
    end loop;
    close c1;
end;

-- Q6
create or replace procedure p1(r in number)
is 
cursor c1(x number) is select * from students where rollno=x;
BEGIN
    for r1 in c1(r) loop
    dbms_output.put_line('Name: '||r1.name|| ', Total: '||r1.total|| ', Age: '||r1.age);
    end loop;
end;
/
BEGIN
    p1(4);
    end;
/

-- Q7
CREATE TABLE EMP1 (
    empno INT PRIMARY KEY,
    ename VARCHAR(50),
    job VARCHAR(50),
    sal DECIMAL(10, 2),
    deptno INT
);
INSERT INTO EMP1 (empno, ename, job, sal, deptno) 
VALUES 
(101, 'Alice', 'Manager', 60000, 10),
(102, 'Bob', 'Clerk', 25000, 20),
(103, 'Charlie', 'Analyst', 50000, 10),
(104, 'Diana', 'Salesman', 30000, 30),
(105, 'Evan', 'Clerk', 22000, 20),
(106, 'Fiona', 'Manager', 65000, 30);

DECLARE
cursor c5 is select * from students;
r1 students%rowtype;
begin
    open c5;
    loop
    fetch c5 into r1;
    exit when c5%notfound;
    dbms_output.put_line('Name: '||r1.name|| ', Total: '||r1.total|| ', Age: '||r1.age);
    end loop;
close c5;
end;

-- Q8
CREATE OR REPLACE FUNCTION f1(d IN NUMBER)
RETURN NUMBER
IS
    CURSOR c1(x NUMBER) IS 
        SELECT empno, ename, job 
        FROM emp1 
        WHERE deptno = x;

    e emp1.empno%TYPE;
    en emp1.ename%TYPE;
    j emp1.job%TYPE;
    count_emps NUMBER := 0;
BEGIN
    OPEN c1(d);
    LOOP
        FETCH c1 INTO e, en, j;
        EXIT WHEN c1%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Empno: ' || e || ', Ename: ' || en || ', Job: ' || j);
        count_emps := count_emps + 1;
    END LOOP;
    CLOSE c1;
    
    RETURN count_emps; -- returning number of employees found
END;
/

select f1(10) from dual;

CREATE OR REPLACE procedure p1(d IN NUMBER)
IS
    CURSOR c1(x NUMBER) IS 
        SELECT empno, ename, job 
        FROM emp1 
        WHERE deptno = x;

    e emp1.empno%TYPE;
    en emp1.ename%TYPE;
    j emp1.job%TYPE;
    count_emps NUMBER := 0;
BEGIN
    OPEN c1(d);
    LOOP
        FETCH c1 INTO e, en, j;
        EXIT WHEN c1%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Empno: ' || e || ', Ename: ' || en || ', Job: ' || j);
    END LOOP;
    CLOSE c1;
     -- returning number of employees found
END p1;
/

begin
    p1(10);
    end;
/

-- Q9
-- local procedure and cursor
declare
cursor c1(n number) is select empno,ename from (select empno,ename from emp1 order by sal desc) where rownum<=n;
FUNCTION f1(x in NUMBER) RETURN NUMBER
    IS
        e emp1.empno%TYPE;
        en emp1.ename%TYPE;
        count_emps NUMBER := 0;
    BEGIN
        OPEN c1(x);
        LOOP
            FETCH c1 INTO e, en;
            EXIT WHEN c1%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('Empno: ' || e || ', Ename: ' || en);
            count_emps := count_emps + 1;
        END LOOP;
        CLOSE c1;
        RETURN count_emps;
    END;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Total Employees Displayed: ' || f1(5));
END;
/

-- Q10
declare
cursor c1(n number) is select * from emp1 where rownum<=n;
procedure p1(x in number)
is
r1 emp1%rowtype;
total number:=0;
begin
    open c1(x);
    loop
    fetch c1 into r1;
    exit when c1%notfound;
    total:=total+r1.sal;
    end loop;
    DBMS_OUTPUT.PUT_LINE('TOTAL: '||total);
    close c1;
end;
begin
    p1(5);
    end;
/
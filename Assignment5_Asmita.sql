-- CREATE DATABASE ASSIGNMENT;
USE ASSIGNMENT;

CREATE TABLE dept(deptno int PRIMARY KEY,dept_name ENUM('Acc','comp','elect'));
ALTER TABLE dept MODIFY COLUMN dept_name VARCHAR(10), ADD CONSTRAINT chk_dept_name CHECK (dept_name IN ('Acc', 'Comp', 'Elect'));

CREATE TABLE emp(empno int PRIMARY KEY,emp_name varchar(30) unique,job ENUM('Prof','AP','Lect'), sal FLOAT NOT NULL, deptno int, mgr_no int, FOREIGN KEY (deptno) REFERENCES dept(deptno), FOREIGN KEY (mgr_no) REFERENCES emp(empno));
CREATE TABLE S(Sno int PRIMARY KEY,Sname varchar(20),city varchar(20));
CREATE TABLE P(pno int PRIMARY KEY, pname varchar(20),color varchar(20));
CREATE TABLE J(jno int PRIMARY KEY, jname varchar(20),city varchar(20));
CREATE TABLE SPJ(sno int, pno int, jno int, PRIMARY KEY(sno,pno,jno), FOREIGN KEY (sno) REFERENCES S(Sno),FOREIGN KEY (pno) REFERENCES P(pno),FOREIGN KEY (jno) REFERENCES J(jno));
ALTER TABLE SPJ ADD qty int;


-- dept table records. 
INSERT INTO dept VALUES (1, 'Acc');
INSERT INTO dept VALUES (2, 'Comp');
INSERT INTO dept VALUES (3, 'Elect');
INSERT INTO dept VALUES (4, 'Comp');
INSERT INTO dept VALUES (5, 'Acc');
select * from dept;

-- emp table.
INSERT INTO emp VALUES (101, 'Alice Johnson', 'Prof', 75000.00, 1, NULL);
INSERT INTO emp VALUES (102, 'Bob Smith', 'AP', 60000.00, 2, 101);
INSERT INTO emp VALUES (103, 'Charlie Brown', 'Lect', 50000.00, 3, 102);
INSERT INTO emp VALUES (104, 'Diana Prince', 'Prof', 80000.00, 2, NULL);
INSERT INTO emp VALUES (105, 'Ethan Hunt', 'AP', 62000.00, 1, 101);

-- Salesperson table.
INSERT INTO S VALUES (1, 'Alice Johnson', 'New York');
INSERT INTO S VALUES (2, 'Bob Smith', 'Los Angeles');
INSERT INTO S VALUES (3, 'Charlie Brown', 'Chicago');
INSERT INTO S VALUES (4, 'Diana Prince', 'Houston');
INSERT INTO S VALUES (5, 'Ethan Hunt', 'Miami');

-- Part table.
INSERT INTO P VALUES (101, 'Bolt', 'Silver');
INSERT INTO P VALUES (102, 'Nut', 'Black');
INSERT INTO P VALUES (103, 'Screw', 'Blue');
INSERT INTO P VALUES (104, 'Washer', 'Red');
INSERT INTO P VALUES (105, 'Gear', 'Green');

-- Project table.
INSERT INTO J VALUES (201, 'Bridge Construction', 'New York');
INSERT INTO J VALUES (202, 'Highway Expansion', 'Los Angeles');
INSERT INTO J VALUES (203, 'Metro Rail', 'Chicago');
INSERT INTO J VALUES (204, 'Solar Power Plant', 'Houston');
INSERT INTO J VALUES (205, 'Airport Renovation', 'Miami');

-- SPJ Table.
INSERT INTO SPJ VALUES (1, 101, 201, 500);
INSERT INTO SPJ VALUES (2, 102, 202, 300);
INSERT INTO SPJ VALUES (3, 103, 203, 400);
INSERT INTO SPJ VALUES (4, 104, 204, 600);
INSERT INTO SPJ VALUES (5, 105, 205, 700);


ALTER TABLE emp MODIFY sal float NULL;
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME='emp';
ALTER TABLE emp DROP INDEX emp_name;
ALTER TABLE emp DROP FOREIGN KEY emp_ibfk_1;
ALTER TABLE emp ADD CONSTRAINT emp_ibfk_1 FOREIGN KEY (deptno) REFERENCES dept(deptno);
ALTER TABLE dept DROP CHECK chk_dept_name;
ALTER TABLE emp ADD COMM int DEFAULT 0;
ALTER TABLE emp MODIFY COMM INT NOT NULL;
CREATE TABLE EMP_COPY as SELECT * FROM emp;

CREATE TABLE dept_copy(new_deptno INT, new_dept_name VARCHAR(35));
INSERT INTO dept_copy(new_deptno, new_dept_name)
SELECT deptno, dept_name FROM dept;
SELECT * FROM dept_copy;

CREATE TABLE dept_copy2 (new_deptno int,new_dept_name VARCHAR(15));
UPDATE emp SET emp_name = 'Akshita', job = 'Clerk' WHERE empno = 100;

DELETE FROM emp WHERE deptno = (SELECT deptno FROM dept WHERE dept_name = 'Comp');

UPDATE emp SET deptno = NULL WHERE deptno = 101;
DELETE FROM dept WHERE deptno = 101;

DELETE FROM emp WHERE deptno = 102;
DELETE FROM dept WHERE deptno = 102;

DELETE FROM emp WHERE empno = 111 AND empno = (SELECT mgr_no FROM emp WHERE empno = 114);

UPDATE emp SET mgr_no = NULL WHERE mgr_no = 112;
DELETE FROM emp WHERE empno = 112;

DROP TABLE emp_copy;
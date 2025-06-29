-- Assignment 2
USE Office;
SHOW TABLES;

CREATE TABLE EMP(EmpNo INT,Ename varchar(40),Job varchar(30),Salary float,Commision int,DeptNo int);
INSERT INTO EMP Values(1,'Asmita','Clerks',25000.90,40,10);
INSERT INTO EMP Values(2,'Akshita','Graphic Designer',130000.90,NULL,20);
INSERT INTO EMP Values(3,'Anushka','Architect',15000.90,20,11);
INSERT INTO EMP Values(4,'Bhavya','Doctor',250000.90,10,12);
INSERT INTO EMP Values(5,'ANANYA','Salesperson',50000.90,NULL,10);
INSERT INTO EMP Values(6,'Raj','Photographer',250000.90,10,12);
INSERT INTO EMP Values(7,'raj','Engineer',25000.45,15,9);

SELECT * FROM EMP;

SELECT EmpNO,Ename FROM Emp WHERE DeptNO=10;
SELECT Ename FROM EMP WHERE Salary>2000 AND Job='Clerks';
SELECT Ename,Job FROM EMP WHERE Job IN('Salesperson','Clerks');
SELECT * FROM EMP WHERE Salary>2000 AND Salary<3000;
SELECT * FROM EMP WHERE DeptNO=10 OR DeptNO=20 OR DeptNO=30;
SELECT Ename FROM EMP WHERE Commision IS NULL;
SELECT DeptNO,Salary FROM Emp ORDER BY DeptNO ASC, Salary DESC;
SELECT Ename FROM EMP WHERE Ename LIKE '%a%a%' OR Ename LIKE '%A%A%';
SELECT Ename FROM EMP WHERE Ename LIKE '_B%' OR Ename LIKE '_b%';
SELECT Ename FROM EMP WHERE Ename LIKE 'A%' OR Ename LIKE 'a%' OR Ename LIKE '%A' OR Ename LIKE '%a'; 
SELECT MAX(Salary),MIN(Salary),AVG(Salary) FROM EMP WHERE DeptNo=10;
SELECT COUNT(*) AS TOTAL_EMP FROM EMP WHERE DeptNo=20;
SELECT SUM(Salary) AS TOTAL_SUM FROM EMP WHERE Job = 'Clerks';

SELECT CURRENT_DATE() AS SYSTEMDATE FROM DUAL;
SELECT (12*12)/13 AS RESULT FROM DUAL;
SELECT * FROM EMP WHERE LOWER(Ename)='raj'; 
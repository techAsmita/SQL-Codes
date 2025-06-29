-- USE COLLEGE;
-- CREATE TABLE CLASS(Name VARCHAR(50), Age INT, Marks Float);
-- DESCRIBE CLASS;
-- SELECT * FROM CLASS;
-- INSERT INTO CLASS VALUES('Asmita',20,91.88),('Akshita',19,90);

-- practice questions
-- CREATE DATABASE XYZ;
-- USE XYZ;
-- CREATE TABLE Employee(ID INT,Name Varchar(50),Salary Float);
-- INSERT INTO Employee Values(1,"adam",25000),(2,"bob",30000),(3,"casey",40000);
-- SELECT * FROM Employee;
-- create database emp1;
-- use emp1;
-- create table student(roll_num int primary key,age int, dob varchar(30),marks float);
-- alter table student add weight float;
-- alter table student modify dob varchar(15);
-- alter table student drop weight;

-- we can also use the commands together
-- alter table student add name varchar(30), modify age int not null,drop column dob;
-- alter table student change roll_num roll int;
-- drop database college;
-- truncate table student;
-- describe student;
-- rename table student to students;
-- alter table students rename column roll to rollnum;
-- insert into students values(1,19,85,'Akshita'),(2,20,91.88,'Asmita');
-- select * from students order by marks desc;
-- show databases;
-- select * from students where name='Asmita';
-- update students set age=21 where name='Akshita';
-- delete from students;


-- create table employee(EmpId int,FirstName varchar(50),Lastname varchar(50),Salary float,Department varchar(50), Hiredate date);
-- alter table employee modify salary float;
-- insert into employee values(1, 'John', 'Doe', 60000.00, 'HR', '2022-01-15'),(2, 'Jane', 'Smith', 75000.00, 'IT', '2021-03-10'),(3, 'Alice', 'Johnson', 82000.00, 'Finance', '2020-08-20'),(4, 'Bob', 'Brown', 50000.00, 'IT', '2023-06-01');
-- delete from employee where department='HR';
-- truncate employee;

-- select * from employee order by salary desc;
-- update employee set salary=5000 where name='Alice';
-- alter table employee add email varchar(100);
-- drop table employee;
-- rename table employee to staff;

-- table level definition of primary key. 
-- create table school(rollnum int, name varchar(50),age int, city varchar(30), primary key(rollnum)); 
-- describe school;
-- alter table school modify name varchar(30) unique;
-- drop table school;

-- create table temp1(id int, salary int default 25000);
-- insert into temp1(id) values(1),(2),(3);
-- select * from temp1;

-- create database friends;
-- use friends;
-- create table school(id int primary key,name varchar(40), age int not null check(age>=18));
-- insert into school values(1,'Asmita',20),(2,'Akshita',19);
-- insert into school values(3,'Anushka',18);
-- describe school;
-- select * from school;
-- select * from school limit 2;
-- aggregate functions
-- create table records(name varchar(50) unique, id int primary key, salary float not null); 
-- insert into records values('asmita',1,50000),('akshita',2,25000),('anushka',3,25000);
-- select sum(salary) as tot_sal from records;
-- select min(salary) from records group by name;
-- select sysdate as actual_date from dual;
-- set sql_safe_updates=0;

-- create table dept(id int primary key, name varchar(50));
-- create table teacher(id int primary key, name varchar(50),dept_id int, foreign key(dept_id) references dept(id));

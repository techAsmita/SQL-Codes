-- Assignment 6
create table d1(deptno number primary key, name varchar(200));
create table d2(empno number primary key,name varchar(200),deptno number, job varchar(200), salary number, foreign key(deptno) references d1(deptno));

select count(*) from d2;
select count(*) from d1;

select * from d2 a inner join d1 b on a.deptno=b.deptno;
select sum(salary),max(salary),min(salary) from d2 where deptno=30;

select name,salary from d2 where salary=(select max(salary) from d2);
select b.name,sum(a.salary) from d2 a inner join d1 b on a.DEPTNO=b.DEPTNO group by b.name;

select job, sum(salary) from d2 group by job;

select a.name,b.job,sum(b.salary) from d2 b inner join d1 a on b.DEPTNO = a.DEPTNO group by a.name,b.job;

select job,avg(salary) from d2 where deptno=20 group by job;
select job,sum(salary) from d2 where job not in ('Manager','Salesman') group by job;

select job,avg(salary) as sal from d2 where deptno=20 group by job having avg(salary)>2000 order by sal desc;

select name,count(*) as total from d1 where DEPTNO !=10 group by name having count(*)>5 order by total desc;

select name,count(*) as total from d1 where name not in ('comp') GROUP by name having count(*)>5 order by total desc;
select a.name,b.job,count(*) from d2 b inner join d1 a on b.DEPTNO = a.DEPTNO group by a.name,b.job;

select a.name as deptname ,b.name as empname from d1 a left join d2 b on a.deptno=b.DEPTNO;
select a.name as empname ,b.name as deptname from d2 a left join d1 b on a.deptno=b.DEPTNO;

select a.name as dname, b.name as ename from d1 a full join d2 b on a.deptno=b.deptno;
-- Assignment 7 subquery
select s.sname from SALESPEOPLE s inner join orders o on s.SNUM = o.SNUM where o.amt>2000;


select s.snum,count(*) from SALESPEOPLE s inner join CUSTOMERS c on s.SNUM = c.SNUM group by s.snum having count(*)>=2;

select s.sname,count(*) from SALESPEOPLE s inner join CUSTOMERS c on s.SNUM = c.SNUM group by s.sname having count(*)>=2;

select count(*) as no_of_people from SALESPEOPLE where city in ('London','Paris');

select c.cname from customers c inner join SALESPEOPLE s on c.SNUM=s.SNUM where c.CITY in ('London','Paris');

select c.cname from customers c where exists(select 1 from orders o where o.CNUM=c.CNUM and amt=1200);

select distinct c.cname from customers c inner join SALESPEOPLE s on c.CITY=s.CITY;

select s.sname,count(*) from SALESPEOPLE s inner join customers c on s.SNUM = c.SNUM where s.comm>10 group by s.sname having count(*)>2;

select c.cname,s.sname,count(*) from CUSTOMERS c inner join SALESPEOPLE s on c.SNUM=s.SNUM inner join orders o on c.SNUM = o.SNUM group by c.cname,s.sname having count(o.ONUM)=1;

insert into SALESPEOPLE values (121, 'john doe', 'singapore', 10);

select * from SALESPEOPLE s left join customers c on s.snum=c.snum where c.snum is null;
select o.odate,count(*) from orders o group by o.odate;

select count(*) from SALESPEOPLE s where exists ( select 1 from SALESPEOPLE d where d.city=s.city and d.comm=s.comm and d.snum!=s.snum);
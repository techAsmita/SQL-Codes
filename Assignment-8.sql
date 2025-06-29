-- Assignment 8
select distinct s.sname from sailors s inner join reserves r on s.SID = r.SID inner join boats b on r.bid=b.BID where b.COLOR='red' or b.COLOR='green';
select distinct s.sname from sailors s inner join reserves r on s.SID = r.SID where exists(select 1 from boats b where b.bid=r.bid and b.COLOR='red') and EXISTS(select 1 from boats b where b.bid=r.bid and b.COLOR='green');

select s.sname from SAILORS s join RESERVES r on s.SID = r.SID join BOATS b on r.BID = b.BID where b.bid=103;

select distinct s.sname from SAILORS s join RESERVES r on s.SID = r.SID join BOATS b on r.BID = b.BID where b.color='red';
select distinct s.sname from SAILORS s join RESERVES r on s.SID = r.SID where not exists(select 1 from boats b where b.BID=r.BID and b.color='red');

select sname from sailors where rating=(select max(rating) from sailors);
select s.sname from SAILORS s join RESERVES r on s.SID = r.SID join BOATS b on r.BID = b.BID group by s.sname having count(distinct b.bid)=(select count(*) from boats b);

select s.sname from sailors s where s.sname!='Horatio' and exists (select 1 from sailors d where d.rating>s.rating);
select s.sname from sailors s where s.rating > all(select d.rating from sailors d where d.sname='Horatio');

select distinct s.sname from sailors s inner join reserves r on s.SID = r.SID;
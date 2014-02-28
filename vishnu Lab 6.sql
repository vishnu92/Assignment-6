--
-- Vishnu Meduri --   -- Lab 6 --

-- 02/28/2014 --



--1.
select distinct c.name, c.city from Customers c
where c.city in (
      select city from Products
      group by city
      order by count(quantity) desc
      limit 1);
--


--2.

select distinct c.name, c.city from Customers c
where c.city in (
      select city from Products
      group by city
      order by count(quantity) desc
      limit 1);
--


--3.

select * from Products
where priceusd > (select avg(priceusd) from products);


-- 4.

select c.name, o.pid, o.dollars
from orders o, customers c
where o.cid = c.cid
order by dollars desc;


-- 5.
 
select c.name, coalesce(sum(o.qty),0) as "total products ordered" from customers c
left outer join orders o
     on c.cid = o.cid
     group by c.name
     order by c.name;

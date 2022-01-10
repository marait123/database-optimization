---------------- query 1 
--- description
-- creating index on title made the query faster
--- optimzation
create index activities_title on activities(title);
--- query
explain analyse
select *
from activities
where title = 'jnSbBwI';
------------------------------------------------------------------
---------------- query 2
--- description
-- join the tables courses, answers, students
-- get the answers of the user on the courses he is enrolled on
-- optimzation
-- query
---------------- query 3
--- split the users table to 3 tables to be able to make queries faster
select *,
    SUBSTRING(cast(birthdate as varchar), 1, 4)
from users
where type = 'Admin'
    and birthdate = '2010-01-01';
---------------- query 4
--- description
-- adding complex index on users
-- 
--- optimzation
create index users_type_date on users(type, birthdate);
--- query
explain analyse
select *
from users
where type = 'Admin'
    and birthdate = '2010-01-01';
---------------- query 5
--- description
-- memory and cache optimization
-- change block size , use stored procedures
-- check link below to know how
-- https://blog.crunchydata.com/blog/optimize-postgresql-server-performance
--- optimzation
--- query
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
--- split the users table to 2 tables to be able to make queries faster
-- this runs of v1 database
explain analyse
select *
from users
where type = 'Admin'
    and birthdate > '2010-01-01'
    and birthdate < '2015-01-01';
-- this runs on v2 database
explain analyse
select *
from admins
where birthdate > '2010-01-01'
    and birthdate < '2015-01-01';
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
where type = 'Learner'
    and birthdate = '2010-01-01';
---------------- query 5
--- description
-- memory and cache optimization
-- change block size , use stored procedures
-- check link below to know how
-- https://blog.crunchydata.com/blog/optimize-postgresql-server-performance
--- optimzation
--- query
---------------- query 6
--- description
-- use views to make queries faster through caching
--- optimzation
--- query
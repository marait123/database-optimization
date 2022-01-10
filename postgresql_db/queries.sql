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
-- get the questions of the user on the courses he is enrolled on
-- optimzation
-- query
-- # normal query not optimized
-- create index course_code on courses(code);
explain analyse
select U.firstname,
    Q.description,
    C.code
from questions as Q,
    users as U,
    courses as C
where Q.course_id = C.id
    and Q.user_id = U.id
order by C.code;
-- # query after optimization
explain analyse
select U.firstname,
    Q.description,
    C.code
from (
        select id,
            firstname
        from users
    ) as U
    join (
        select description,
            user_id,
            course_id
        from questions
    ) as Q on U.id = Q.user_id
    join (
        select code,
            id
        from courses
    ) as C on C.id = Q.course_id
order by C.code;
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
SET LOCAL work_mem = '256MB';
--- query
BEGIN;
-- comment below line to see the performance degradation
SET LOCAL work_mem = '256MB';
--- query
explain analyse
select U.firstname,
    Q.description,
    C.code
from questions as Q,
    users as U,
    courses as C
where Q.course_id = C.id
    and Q.user_id = U.id
order by C.code;
-- commit the change (or roll it back later)
COMMIT;
---------------- query 6
--- description
-- use views to make queries faster through caching
-- # create view to display users info
--- optimzation
CREATE VIEW users_questions AS
select U.firstname,
    Q.description,
    C.code
from questions as Q,
    users as U,
    courses as C
where Q.course_id = C.id
    and Q.user_id = U.id
order by C.code;
--- query
explain (analyse, buffers)
select *
from users_questions;
-- informaction queries
-- @ to know if users table has any errors
vacuum (verbose) users;
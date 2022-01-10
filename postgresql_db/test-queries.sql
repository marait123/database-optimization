--
explain analyse
select id
from users
where id = 10000;
QUERY PLAN --
explain analyse
select *
from users
where id = 10000;
QUERY PLAN -- get the people born on the day where 8 people where born in the same day 
--
select *
from users
    join (
        select birthdate,
            count(*) as _count
        from users
        group by birthdate
        having count(*) = 8
    ) as f on users.birthdate = f.birthdate;
--- creating index on title made the query faster
create index activities_title on activities(title);
explain analyse
select *
from activities
where title = 'jnSbBwI';
-- 
select *,
    SUBSTRING(cast(birthdate as varchar), 1, 4)
from users
where type = 'Admin'
    and birthdate = '2010-01-01';
--- increasing the index storage (badd)
create index users_id_firstname_idx on users(id) include(firstname);
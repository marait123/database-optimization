create or replace function random_string(length integer) returns text as $$
declare chars text [] := '{A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z}';
result text := '';
i integer := 0;
length2 integer := (
    select trunc(random() * length + 1)
);
begin if length2 < 0 then raise exception 'Given length cannot be less than 0';
end if;
for i in 1..length2 loop result := result || chars [1+random()*(array_length(chars, 1)-1)];
end loop;
return result;
end;
$$ language plpgsql;
SELECT NOW() + (random() * (NOW() + '100 days' - NOW())) + '20 days';
-- fill the user's table 20000
delete from users;
insert into users (
        SELECT generate_series(1, 20000) AS id,
            random_string(10) as password,
            CONCAT (random_string(10), '@yahoo.com') as email,
            random_string(10) as firstName,
            random_string(10) as lastName,
            NOW() - (random() * (NOW() + '50 years' - NOW())) as birthdate,
            (array ['Instructor', 'Student', 'Admin']) [floor(random() * 3 + 1)] as type
    );
select *
from users;
-- fill the courses's table 100000
delete from courses;
insert into courses (
        SELECT generate_series(1, 100000) AS id,
            random_string(10) || cast(generate_series(1, 100000) as text) as code,
            trunc(random() *(20000) + 1) as user_id
    );
select *
from courses;
-- fill enrolled_courses 100000
delete from enrolled_courses;
insert into enrolled_courses (
        SELECT generate_series(1, 100000) AS id,
	        trunc(random() *(20000) + 1) as user_id,
            trunc(random() *(100000) + 1) as course_id

    );
select *
from enrolled_courses;
-- fill the activities's table 200000
delete from activities;
insert into activities (
        SELECT generate_series(1, 200000) AS id,
            random_string(10) as title,
            random_string(20) as attachmentPath,
            trunc(random() *(100000) + 1) as course_id
    );
select *
from activities;
-- fill the questions's table 3000000
delete from questions;
insert into questions (
        SELECT generate_series(1, 300000) AS id,
            random_string(30) as description,
            trunc(random() *(100000) + 1) as course_id,
            trunc(random() *(20000) + 1) as user_id
    );
select *
from questions;
-- fill the answers's table 400000
delete from answers;
insert into answers (
        SELECT generate_series(1, 400000) AS id,
            random_string(30) as description,
            trunc(random() *(300000) + 1) as course_id,
            trunc(random() *(20000) + 1) as user_id
    );
select *
from answers;
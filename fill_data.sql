create or replace function random_string(length integer) returns text as $$
declare chars text [] := '{0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z}';
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
-- fill the user's table
delete from users;
insert into users (
        SELECT generate_series(1, 101) AS id,
            random_string(10) as password,
            CONCAT (random_string(10), '@yahoo.com') as email,
            random_string(10) as firstName,
            random_string(10) as lastName,
            NOW() - (random() * (NOW() + '50 years' - NOW())) as birthdate,
            random_string(10) as type
    );
select *
from users;
-- fill the courses's table
delete from courses;
insert into courses (
        SELECT generate_series(1, 1000) AS id,
            random_string(10) || cast(generate_series(1, 1000) as text) as code,
            trunc(random() *(100) + 1) as user_id
    );
select *
from courses;
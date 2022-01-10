DROP TABLE IF EXISTS users CASCADE;
create table users(
    id serial primary key,
    password VARCHAR(100),
    email VARCHAR(100),
    firstName VARCHAR(100),
    lastName VARCHAR(100),
    birthdate date,
    type VARCHAR(100)
);
-- 
DROP TABLE IF EXISTS courses CASCADE;
create TABLE courses(
    id serial primary key,
    code varchar(100) not null UNIQUE,
    user_id int not null,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
-- 
DROP TABLE IF EXISTS enrolled_courses CASCADE;
create TABLE enrolled_courses(
    id serial primary key,
    user_id int not null,
    course_id int not null,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
);
-- 
DROP TABLE IF EXISTS activities CASCADE;
create TABLE activities(
    id serial primary key,
    title VARCHAR(100),
    attachmentPath VARCHAR(100),
    course_id int not null,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
);
-- 
DROP TABLE IF EXISTS questions CASCADE;
create TABLE questions(
    id serial primary key,
    description text,
    course_id int not null,
    user_id int not null,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
-- 
DROP TABLE IF EXISTS answers CASCADE;
create TABLE answers(
    id serial primary key,
    description text,
    question_id int not null,
    user_id int not null,
    FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
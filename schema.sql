DROP TABLE IF EXISTS users;
create table users(
    id serial primary key,
    password VARCHAR(100),
    email VARCHAR(100),
    firstName VARCHAR(100),
    lastName VARCHAR(100),
    birthdate date,
    type VARCHAR(100),
    name VARCHAR(100)
);
-- 
DROP TABLE IF EXISTS courses;
create TABLE courses(
    id serial primary key,
    code varchar(100) not null UNIQUE
);
-- 
DROP TABLE IF EXISTS activities;
create TABLE activities(
    id serial primary key,
    title VARCHAR(100),
    attachmentPath VARCHAR(100),
    course_id int not null,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
);
-- 
DROP TABLE IF EXISTS questions;
create TABLE questions(
    id serial primary key,
    description text,
    course_id int not null,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
);
-- 
DROP TABLE IF EXISTS answers;
create TABLE answers(
    id serial primary key,
    description text,
    question_id int not null,
    FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE
);
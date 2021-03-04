--DROP TABLE users;
--DROP TABLE posts;

CREATE TABLE users ( id serial primary key, name varchar(255), score real, team varchar(255) );

INSERT INTO users (name, score, team) values ('taguchi', 5.5, 'red'), ('fkoji', 8.3, 'blue'), ('dotinstall', 2.2, 'blue'), ('sasaki', 5.0, 'green'), ('sakaki', 4.6, 'red'), ('kimura', 4.7, 'green');

CREATE TABLE posts ( id serial primary key, user_id int not null, title varchar(255) not null, body text not null );

INSERT INTO posts (user_id, title, body) values (1, 'title1', 'body1'), (1, 'title2', 'body2'), (2, 'title3', 'body3'), (5, 'title4', 'body4'), (4, 'title5', 'body5');

SELECT  *
FROM users;

SELECT  *
FROM posts;

SELECT  users.name
       ,posts.title
FROM users, posts
WHERE users.id = posts.user_id; 

SELECT  u.name
       ,p.title
FROM users u, posts p
WHERE u.id = p.user_id; 

SELECT  u.name
       ,p.title
FROM users u, posts p
WHERE u.id = p.user_id 
AND u.id=1; 

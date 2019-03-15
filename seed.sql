DROP DATABASE IF EXISTS bits;
CREATE DATABASE bits;

\c bits;

CREATE TABLE users (
    id SERIAL PRIMARY KEY, 
    username VARCHAR UNIQUE NOT NULL, 
    avatar VARCHAR, 
    first_name VARCHAR, 
    last_name VARCHAR, 
    email VARCHAR UNIQUE NOT NULL,
    bio VARCHAR, 
    foods VARCHAR, 
    music VARCHAR, 
    movies VARCHAR, 
    following_number INT NOT NULL,
    follower_number INT NOT NULL, 
    relationship_status VARCHAR NOT NULL, 
    website_url VARCHAR,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY, 
    post_author INT REFERENCES users(id) NOT NULL, 
    post_img VARCHAR, 
    post_text VARCHAR NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE comment (
    id SERIAL PRIMARY KEY, 
    comment_author INT REFERENCES users(id),
    post_id INT REFERENCES posts(id),
    comment_text VARCHAR NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE likes (
    id SERIAL PRIMARY KEY, 
    like_author INT REFERENCES users(id),
    post_liked INT REFERENCES posts(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE follow (
    id SERIAL PRIMARY KEY, 
    follower_user_id INT REFERENCES users(id),
    person_being_followed_id INT REFERENCES users(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (username, avatar, first_name, last_name, email, following_number, follower_number, relationship_status) VALUES
('josemlrod', 'https://scontent-iad3-1.cdninstagram.com/vp/bd7a3145499809c04e0a80adae9565f1/5D088C0F/t51.2885-15/sh0.08/e35/s750x750/43107549_237555317115897_1660968452996726784_n.jpg?_nc_ht=scontent-iad3-1.cdninstagram.com',
'Jose', 'Rodriguez', 'joserodriguez@pursuit.org', 10000, 1, 'Taken');
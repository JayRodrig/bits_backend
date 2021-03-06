DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS likes;
DROP TABLE IF EXISTS follow;

CREATE TABLE users (
    id SERIAL PRIMARY KEY, 
    username VARCHAR UNIQUE NOT NULL,
    firebase_uid VARCHAR UNIQUE NOT NULL, 
    avatar VARCHAR, 
    first_name VARCHAR NOT NULL, 
    last_name VARCHAR NOT NULL, 
    email VARCHAR UNIQUE NOT NULL,
    bio VARCHAR, 
    foods VARCHAR, 
    music VARCHAR, 
    movies VARCHAR, 
    following_number INT,
    follower_number INT, 
    rel_status VARCHAR NOT NULL, 
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

CREATE TABLE comments (
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

CREATE UNIQUE INDEX a_like ON likes (like_author, post_liked);

CREATE TABLE follow (
    id SERIAL PRIMARY KEY, 
    follower_user_id INT REFERENCES users(id),
    followed_user_id INT REFERENCES users(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

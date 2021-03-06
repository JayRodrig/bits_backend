// LOCAL MODULE
const db = require('./database');

// GLOBAL VARIABLE
const PostServices = {};

PostServices.createPost = (post_author, post_img, post_text) => db.none(
    `INSERT INTO
        posts (post_author, post_img, post_text)
    VALUES
        ($[post_author], $[post_img], $[post_text])`,
    {post_author, post_img, post_text,}
);

PostServices.readPost = post_id => db.one(
    `SELECT * FROM posts JOIN users 
    ON post_author = users.id 
    WHERE posts.id = $[post_id]`, {post_id,}
);

PostServices.readPostComments = post_id => db.any(
    `SELECT 
       *
    FROM posts JOIN comments 
        ON 
    posts.id = comments.post_id 
        JOIN users 
        ON
    posts.post_author = users.id
    WHERE comments.post_id = $[post_id]
    `, {post_id,}
);

PostServices.updatePost = (post_author, post_img, post_text, post_id) => db.none(
    `UPDATE posts SET
        post_author = $[post_author], post_img = $[post_img], post_text = $[post_text]
    WHERE
        id = $[post_id]`, {post_author, post_img, post_text, post_id,}
);

PostServices.deletePost = post_id => db.none(
    'DELETE FROM comments WHERE post_id=${post_id}; DELETE FROM posts WHERE id=${post_id};', {post_id,} 
)


module.exports = PostServices;
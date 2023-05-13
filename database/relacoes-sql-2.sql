-- Active: 1680732883440@@127.0.0.1@3306

CREATE TABLE users (
    id TEXT PRIMARY KEY NOT NULL UNIQUE,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    created_at TEXT DEFAULT(DATETIME('now', 'localtime')) NOT NULL
);

DROP TABLE users;

INSERT INTO users (id, name, email, password)
VALUES
    ("u001", "tonzerapinador", "tonzerapinador@gmail.com", "123456"),
    ("u002", "suetam", "suetam@gmail.com", "123456"),
    ("u003", "tonzerapinador2", "tonzerapinador2@gmail.com", "123456");

SELECT * FROM users;

CREATE TABLE follows (
    follower_id TEXT NOT NULL,
    followed_id TEXT NOT NULL,
    FOREIGN KEY (follower_id) REFERENCES users(id),
    FOREIGN KEY (followed_id) REFERENCES users(id)
);

DROP TABLE follows;

INSERT INTO follows (follower_id, followed_id)
VALUES
    ("u001", "u002"),
    ("u001", "u003"),
    ("u002", "u001");

SELECT * FROM follows;

SELECT * FROM users 
LEFT JOIN follows
ON follows.follower_id = users.id;

SELECT 
users.id,
users.name,
user2.id AS followed_id,
user2.name AS followed_name
FROM users 
LEFT JOIN follows
ON follows.follower_id = users.id
LEFT JOIN users AS user2
ON follows.followed_id = user2.id;
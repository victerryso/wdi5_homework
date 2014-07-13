CREATE TABLE posts (
  id integer PRIMARY KEY AUTOINCREMENT,
  content text,
  heading text,
  posted text --USE YYYY-MM-DD HH:MM
);

CREATE TABLE comments (
  id integer PRIMARY KEY AUTOINCREMENT,
  content text,
  user text,
  postid integer,
  FOREIGN KEY (postid) REFERENCES posts(id)
);
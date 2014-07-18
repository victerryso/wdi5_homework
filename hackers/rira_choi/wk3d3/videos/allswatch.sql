CREATE TABLE categories (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT
);

create table videos(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  category_id INTEGER,
  genre TEXT,
  title TEXT,
  url TEXT,
  description TEXT
);

insert into categories (name) values ("Asking");
insert into categories (name) values ("Laughing");
insert into categories (name) values ("Listening");
insert into categories (name) values ("Studying");
insert into categories (name) values ("Watching");
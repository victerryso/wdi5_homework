CREATE TABLE videos(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT,
  description TEXT,
  url TEXT,
  genre TEXT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
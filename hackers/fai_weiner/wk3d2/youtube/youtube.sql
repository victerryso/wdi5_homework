CREATE TABLE youtubes (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT,
  description TEXT,
  url TEXT,
  genre TEXT
);

CREATE TABLE genres (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  genre TEXT
);

CREATE TABLE youtubes_genres (
  video_id INTEGER,
  genre_id INTEGER
);
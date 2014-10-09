CREATE TABLE steakhouses (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  logo TEXT,
  url TEXT,
  address TEXT,
  zipcode_id INTEGER,
  description TEXT,
  style TEXT,
  rating INTEGER,
  latitude TEXT,
  longtitude TEXT
);

CREATE TABLE raters (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  first_name TEXT,
  last_name TEXT
);

CREATE TABLE raters_steakhouses (
  rater_id INTEGER,
  steakhouse_id INTEGER,
  rating INTEGER
);

CREATE TABLE zipcodes (
  id INTEGER PRIMARY KEY,
  city_name TEXT
);
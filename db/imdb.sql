DROP TABLE castings;
DROP TABLE stars;
DROP TABLE movies;

CREATE TABLE movies (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  genre VARCHAR(255),
  budget INT8
);

CREATE TABLE stars (
  id SERIAL4 PRIMARY KEY,
  forename VARCHAR(255),
  surname VARCHAR(255)
);

CREATE TABLE castings (
  id SERIAL4 PRIMARY KEY,
  movie_id INT4 REFERENCES movies(id) ON DELETE CASCADE,
  star_id INT4 REFERENCES stars(id) ON DELETE CASCADE,
  fee INT8
);

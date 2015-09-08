drop database memetubes;

create database memetubes;

\connect memetubes

drop table memes;

create table memes (
  id serial8 primary key,
  title varchar(200) NOT NULL,
  url varchar(200) NOT NULL,
  genre varchar(50) NOT NULL,
  description text,
  views int
);

INSERT INTO memes (title, url, genre, description) VALUES ('Best Andy Dwyer Scenes', 'https://www.youtube.com/watch?v=YF6jADQ4ozY', 'comedy', 'Hilarious scenes featuring Andy Dwyer (Chris Pratt) of Parks and Rec');
INSERT INTO memes (title, url, genre, description) VALUES ('Pittsburgh Steelers 2008 Defense Ultra Highlights', 'https://www.youtube.com/watch?v=iqWZ74BLATI', 'sports', 'Defensive highlights of the Pittsburgh Steelers 2008 season');
INSERT INTO memes (title, url, genre, description) VALUES ('Grannies Smoking Weed for the First Time', 'https://www.youtube.com/watch?v=IRBAZJ4lF0U', 'comedy', 'Now that pot is becoming legal in the US, three grannies get high and play Cards Against Humanity together');

-- create scripts for the recipe database

CREATE DATABASE recipe;


CREATE TABLE author (
   id serial,
   firstname varchar(64) NOT NULL,
   lastname varchar(64) NOT NULL,
   PRIMARY KEY (id)
);


CREATE TABLE recipe (
	id serial,
	name
	description
	prep_time
	serves
	auther_id integer NOT NULL,
	PRIMARY KEY (id),
	CONSTRAINT cname FOREIGN KEY (user_id)
		REFERENCES author (id) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION
);
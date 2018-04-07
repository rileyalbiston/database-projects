
-- postgres script for creating the motorcycle maintenance
-- database and tables

-- =============== CREATE ===============
-- ======================================

CREATE DATABASE motorcycle_maintenance;


CREATE TABLE motorcycle (
	id serial,
	make varchar(255) NOT NULL,
	model varchar(255) NOT NULL,
	year integer NOT NULL,
	description varchar(255), 
	PRIMARY KEY (id)
);

CREATE TABLE service (
	id serial, 
	service_date date,
	odometer integer, 
	details varchar(255),
	motorcycle_id integer NOT NULL;
	PRIMARY KEY (id)
);

CREATE TABLE part (
	id serial,
	brand varchar(255),
	part_number varchar(255),
	description varchar(255),
	category_id integer,
	motorcycle_id integer NOT NULL;
	PRIMARY KEY (id)
);

CREATE TABLE category (
	id serial,
	category varchar(255),
	PRIMARY KEY (id)
);

CREATE TABLE comment (
	id serial,
	comment varchar(255),
	part_id integer,
	PRIMARY KEY (id)
);

CREATE TABLE link (
	id serial,
	url varchar(255),
	comment varchar(255),
	part_id integer,
	PRIMARY KEY (id)
);

CREATE TABLE service_part (
	service_id integer NOT NULL,
	part_id integer NOT NULL,
	CONSTRAINT service_part_pkey PRIMARY KEY (service_id, part_id),
	CONSTRAINT service_part_service_fkey FOREIGN KEY (service_id) REFERENCES service (id) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT service_part_part_fkey FOREIGN KEY (part_id) REFERENCES part (id) ON UPDATE CASCADE ON DELETE RESTRICT
	);

-- =============== ADD CONSTRAINT ===============
-- ==============================================

-- example

-- ALTER TABLE table_name
-- ADD CONSTRAINT constraint_name FOREIGN KEY (column) REFERENCES ref_table (ref_column) ON UPDATE ... ON DELETE ...

ALTER TABLE part
ADD CONSTRAINT part_category_fkey FOREIGN KEY (category_id) REFERENCES category (id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE comment
ADD CONSTRAINT comment_part_fkey FOREIGN KEY (part_id) REFERENCES part (id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE link
ADD CONSTRAINT link_part_fkey FOREIGN KEY (part_id) REFERENCES part (id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE part
ADD CONSTRAINT part_motorcycle_fkey FOREIGN KEY (motorcycle_id) REFERENCES motorcycle (id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE service
ADD CONSTRAINT service_motorcycle_fkey FOREIGN KEY (motorcycle_id) REFERENCES motorcycle (id) ON UPDATE CASCADE ON DELETE RESTRICT;

-- temp alter table to add coulmns 

-- ALTER TABLE part
-- ADD motorcycle_id integer NOT NULL;

-- ALTER TABLE service
-- ADD motorcycle_id integer NOT NULL;
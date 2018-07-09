
-- postgres script for creating the motorcycle maintenance
-- database and tables

-- =============== CREATE ===============
-- ======================================

-- CREATE DATABASE vehicle_maintenance;
-- DROP DATABASE vehicle_maintenance;

-- psql -U postgres -d vehicle_maintenance -a -f postgres_vehicle.sql

CREATE TABLE IF NOT EXISTS vehicle (
	id serial,
	make varchar(255) NOT NULL,
	model varchar(255) NOT NULL,
	year integer NOT NULL,
	description varchar(255), 
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS service (
	id serial, 
	service_date date,
	odometer integer, 
	details varchar(255),
	vehicle_id integer NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS part (
	id serial,
	brand varchar(255),
	part_number varchar(255),
	description varchar(255),
	category_id integer,
	vehicle_id integer NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS category (
	id serial,
	category varchar(255),
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS comment (
	id serial,
	comment varchar(255),
	part_id integer,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS link (
	id serial,
	url varchar(255),
	comment varchar(255),
	part_id integer,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS project (
	id serial,
	description varchar(255),
	vehicle_id integer,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS step (
	id serial,
	details varchar(255),
	project_id integer,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS service_part (
	service_id integer NOT NULL,
	part_id integer NOT NULL,
	CONSTRAINT service_part_pkey PRIMARY KEY (service_id, part_id),
	CONSTRAINT service_part_service_fkey FOREIGN KEY (service_id) REFERENCES service (id) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT service_part_part_fkey FOREIGN KEY (part_id) REFERENCES part (id) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS project_part (
	project_id integer NOT NULL,
	part_id integer NOT NULL,
	CONSTRAINT project_part_pkey PRIMARY KEY (project_id, part_id),
	CONSTRAINT project_part_project_fkey FOREIGN KEY (project_id) REFERENCES project (id) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT project_part_part_fkey FOREIGN KEY (part_id) REFERENCES part (id) ON UPDATE CASCADE ON DELETE RESTRICT
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
ADD CONSTRAINT part_vehicle_fkey FOREIGN KEY (vehicle_id) REFERENCES vehicle (id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE service
ADD CONSTRAINT service_vehicle_fkey FOREIGN KEY (vehicle_id) REFERENCES vehicle (id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE project
ADD CONSTRAINT project_vehicle_fkey FOREIGN KEY (vehicle_id) REFERENCES vehicle (id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE step
ADD CONSTRAINT step_project_fkey FOREIGN KEY (project_id) REFERENCES project (id) ON UPDATE CASCADE ON DELETE RESTRICT;

-- temp alter table to add coulmns 

-- ALTER TABLE part
-- ADD motorcycle_id integer NOT NULL;

-- ALTER TABLE service
-- ADD motorcycle_id integer NOT NULL;

--ALTER TABLE part 
--RENAME COLUMN motorcycle_id TO vehicle_id;
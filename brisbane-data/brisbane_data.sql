
-- CREATE DATABASE brisbane_data;


DROP TABLE adjacent_suburb;
DROP TABLE suburb;

--==============================================================================
--==============================================================================

CREATE TABLE adjacent_suburb (
	id serial,
	suburb varchar(64) NOT NULL,
	adjoining_suburb varchar(64),
	PRIMARY KEY(id)
);

\COPY adjacent_suburb(suburb, adjoining_suburb) FROM 'C:/Users/Riley/Desktop/Brisbane Data/adjacentsuburbs20171108.csv' DELIMITER ',' CSV HEADER;

SELECT id, suburb, adjoining_suburb FROM adjacent_suburb;

--=========

ALTER TABLE adjacent_suburb
ADD CONSTRAINT adjacent_suburb_suburb_fk2 FOREIGN KEY (suburb) REFERENCES suburb (suburb);

ALTER TABLE adjacent_suburb
ADD CONSTRAINT adjacent_suburb_suburb_fk3 FOREIGN KEY (adjoining_suburb) REFERENCES suburb (suburb);

--==============================================================================
--==============================================================================

CREATE TABLE suburb (
	id serial,
	suburb varchar(64) UNIQUE NOT NULL,
	PRIMARY KEY(id)
);

\COPY suburb(suburb) FROM 'C:/Users/Riley/Desktop/Brisbane Data/test.csv' DELIMITER ',' CSV HEADER;

SELECT id, suburb FROM suburb;

--==============================================================================
--==============================================================================

CREATE TABLE public_wifi (
	id serial,
	wifi_hotspot_name varchar(255),
	address varchar(255),
	suburb varchar(255),
	latitude decimal,
	longitude decimal,
	site varchar(255),
	PRIMARY KEY(id)
);

ALTER TABLE public_wifi
ADD CONSTRAINT public_wifi_suburb_fk2 FOREIGN KEY (suburb) REFERENCES suburb (suburb);

\COPY public_wifi(wifi_hotspot_name, address, suburb, latitude, longitude, site) FROM 'C:/Users/Riley/Desktop/Brisbane Data/wifi_upper_suburb.csv' DELIMITER ',' CSV HEADER;

SELECT * FROM public_wifi;
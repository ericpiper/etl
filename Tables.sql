
-- DROP EXISTING TABLES

DROP TABLE counties;
DROP TABLE drought;
DROP TABLE fires;
DROP TABLE search_keywords;

-- CREATE TABLES

CREATE TABLE counties (
	id SERIAL UNIQUE, 
	county VARCHAR (255) NOT NULL,
	CONSTRAINT pk_counties PRIMARY KEY (
        county
     )
);

CREATE TABLE drought (
	county VARCHAR(255),
	no_drought FLOAT(2),
	d0 FLOAT(2),
	d1 FLOAT(2),
	d2 FLOAT(2),
	d3 FLOAT(2),
	d4 FLOAT(2),
	valid_start date NOT NULL,
	valid_end date NOT NULL
);

CREATE TABLE fires (
	acres_burned INT,
	active BOOLEAN,
	admin_unit VARCHAR(255),
	air_tankers INT,
	county VARCHAR(255),
	county_ids VARCHAR(255),
	crews_involved INT,
	dozers INT,
	engines INT,
	extinguished DATE NOT NULL,
	fatalities INT,
	fuel_type INT,
	helicopters INT, 
	injuries INT,
	latitude FLOAT(6), 
	location VARCHAR(255),
	longitude FLOAT(6),
	major_incident BOOLEAN,
	name VARCHAR(255),
	personnel_involved  INT,
	search_description VARCHAR(255),
	search_keywords VARCHAR(255),
	started DATE NOT NULL,
	structures_damaged INT,
	structures_destroyed INT,
	structures_threatened INT,
	water_tenders INT
);

CREATE TABLE search_keywords (
	search_keywords VARCHAR(255)
);


-- ADD FOREIGN KEYS TO TABLES
ALTER TABLE drought ADD CONSTRAINT fk_drought_county FOREIGN KEY(county)
REFERENCES counties (county);

ALTER TABLE fires ADD CONSTRAINT fk_fires_county FOREIGN KEY(county)
REFERENCES counties (county);

--ALTER TABLE Search_Keywords ADD CONSTRAINT fk_key_search_county FOREIGN KEY(id)
--REFERENCES counties (id);

-- IMPORTED DATA FROM CSV'S IN THE FOLLOWING ORDER THEN CHECK TABLES
SELECT * FROM counties;
SELECT * FROM drought;
SELECT * FROM fires;
SELECT * FROM search_keywords;

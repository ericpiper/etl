
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
        id
     )
);

CREATE TABLE drought (
	county VARCHAR(255),
	no_drought int,
	d0 int,
	d1 int,
	d2 int,
	d3 int,
	d4 int,
	valid_start date NOT NULL,
	valid_end date NOT NULL
);

CREATE TABLE fires (
	acres_burned int,
	active boolean,
	admin_unit VARCHAR(255),
	air_tankers int,
	county VARCHAR(255),
	county_ids VARCHAR(255),
	crews_involved int,
	dozers int,
	engines int,
	extinguished date NOT NULL,
	fatalities int,
	fuel_type int,
	helicopters int, 
	injuries int,
	latitude float(6), 
	location int,
	longitude float(6),
	major_incident boolean,
	name VARCHAR(255)
	search_description VARCHAR(255),
	search_keywords VARCHAR(255),
	started date NOT NULL,
	structures_damaged int,
	structures_destroyed int,
	structures_threatened int,
	water_tenders int,
);

CREATE TABLE search_keywords (
	search_keywords VARCHAR()
);


-- ADD FOREIGN KEYS TO TABLES
ALTER TABLE drought ADD CONSTRAINT fk_drought_ county FOREIGN KEY(county)
REFERENCES counties (county);

ALTER TABLE fires ADD CONSTRAINT fk_fires_county FOREIGN KEY(county)
REFERENCES counties (county);


-- ALTER TABLE Search_Keywords ADD CONSTRAINT fk_key_search_county FOREIGN KEY(id)
-- REFERENCES counties (id);

-- IMPORTED DATA FROM CSV'S IN THE FOLLOWING ORDER THEN CHECK TABLES
SELECT * FROM counties;
SELECT * FROM drought;
SELECT * FROM fires;
SELECT * FROM search_keywords



------------------------------------------------------------------------------------------------
-- 1. In descending order, list the frequency of fires by county
------------------------------------------------------------------------------------------------
DROP VIEW fires_count_counties;

CREATE VIEW fires_count_counties AS
SELECT f.county,
    COUNT(*) occurrences
FROM fires f
GROUP BY f.county
ORDER BY occurrences DESC;

SELECT * FROM fires_count_counties;
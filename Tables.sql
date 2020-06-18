
-- DROP EXISTING TABLES

DROP TABLE counties;
DROP TABLE drought;
DROP TABLE fires;
DROP TABLE search_keywords;

-- CREATE TABLES

CREATE TABLE counties (
	 id SERIAL UNIQUE, 
	County VARCHAR (255) NOT NULL,
	CONSTRAINT pk_counties PRIMARY KEY (
        id
     )
);

CREATE TABLE drought (
	County VARCHAR(255),
	No_Drought int,
	D0 int,
	D1 int,
	D2 int,
	D3 int,
	D4 int,
	Valid_Start date NOT NULL,
	Valid_end date NOT NULL
);

CREATE TABLE fires (
	Acres_Burned int,
	Active boolean,
	Admin_Unit VARCHAR(255),
	Air_Tankers int,
	County VARCHAR(255),
	County_Ids VARCHAR(255),
	Crews_Involved int,
	Dozers int,
	Engines int,
	Extinguished date NOT NULL,
	Fatalities int,
	Fuel_Type int,
	Helicopters int, 
	Injuries int,
	Latitude float(6), 
	Location int,
	Longitude float(6),
	Major_Incident boolean,
	Name VARCHAR(255)
	Search_Description VARCHAR(255),
	Search_Keywords VARCHAR(255),
	Started date NOT NULL,
	Structures_Damaged int,
	Structures_Destroyed int,
	Structures_Threatened int,
	Water_Tenders int,
);

CREATE TABLE search_keywords (
	Search_Keywords VARCHAR()
);


-- ADD FOREIGN KEYS TO TABLES
ALTER TABLE drought ADD CONSTRAINT fk_drought_ County FOREIGN KEY(County)
REFERENCES counties (County);

ALTER TABLE fires ADD CONSTRAINT fk_fires_County FOREIGN KEY(County)
REFERENCES counties (County);


-- ALTER TABLE Search_Keywords ADD CONSTRAINT fk_key_search_County FOREIGN KEY(id)
-- REFERENCES counties (id);

-- IMPORTED DATA FROM CSV'S IN THE FOLLOWING ORDER THEN CHECK TABLES
SELECT * FROM drought;
SELECT * FROM ;


------------------------------------------------------------------------------------------------
-- 1. In descending order, list the frequency of fires by county
------------------------------------------------------------------------------------------------
DROP VIEW fires_count_counties;

CREATE VIEW fires_count_counties AS
SELECT f.County,
    COUNT(*) occurrences
FROM fires f
GROUP BY f.County
ORDER BY occurrences DESC;

SELECT * FROM fires_count_counties;

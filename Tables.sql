create table counties (
	County VARCHAR (255),
	PRIMARY KEY (County)
)

create table drought (
	County VARCHAR(255),
	No_Drought int,
	D0 int,
	D1 int,
	D2 int,
	D3 int,
	D4 int,
	Valid_Start date NOT NULL,
	Valid_end date NOT NULL
	FOREIGN KEY (County)
)

create table fires (
	Acres_Burned int,
	Active boolean,
	Admin_Unit VARCHAR(255),
	Air_Tankers int,
	Counties VARCHAR(255),
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
	FOREIGN KEY (County)
)

create table search_keywords (
	Search_Keywords VARCHAR()
)
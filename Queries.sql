
-- CHECK TABLES
SELECT * FROM counties;
SELECT * FROM drought;
SELECT * FROM fires;

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

------------------------------------------------------------------------------------------------
-- 2. Riverside fires
------------------------------------------------------------------------------------------------
DROP VIEW riverside_fires;

CREATE VIEW riverside_fires AS
SELECT f.county, f.name, f.started, f.extinguished, f.acres_burned
FROM fires f
WHERE f.county = 'Riverside'
ORDER BY f.started DESC;

SELECT * FROM riverside_fires;

----------------------------------------------------------------------------------------------
-- 3. Fires that have burned more than 10000 acres
----------------------------------------------------------------------------------------------

DROP VIEW acres_burned;

CREATE VIEW acres_burned AS
SELECT f.name,f.acres_burned, f.started, f.extinguished, d.county, d.valid_start, d.valid_end, d.d4, d.d3, d.d2, d.d1, d.d0, d.no_drought
FROM ((fires f
Inner JOIN drought d
	   ON f.county = d.county))
WHERE f.acres_burned > 10000;

SELECT * 
FROM acres_burned 
WHERE valid_start >= '2013/07/15'
AND  valid_end <= '2013/07/30';

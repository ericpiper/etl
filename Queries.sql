-- DROP TABLES
DROP TABLE counties;
DROP TABLE drought;
DROP TABLE fires;
DROP TABLE search_keywords;


-- CHECK TABLES
SELECT * FROM counties;
SELECT * FROM drought;
SELECT * FROM fires;
SELECT * FROM search_keywords;

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
-- 1. Riverside fires
------------------------------------------------------------------------------------------------
DROP VIEW riverside_fires;

CREATE VIEW riverside_fires AS
SELECT f.county, f.name, f.started, f.extinguished, f.acres_burned, f.search_keywords
FROM fires f
WHERE f.county = 'Riverside'
ORDER BY f.started DESC;

SELECT * FROM riverside_fires;
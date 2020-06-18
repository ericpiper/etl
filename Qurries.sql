
-- CHECK TABLES
SELECT * FROM counties;
SELECT * FROM drought;
SELECT * FROM fires;
SELECT * FROM search_keywords;

------------------------------------------------------------------------------------------------
-- 1. In descending order, list the frequency of fires by county
------------------------------------------------------------------------------------------------
-- DROP VIEW fires_count_counties;

CREATE VIEW fires_count_counties AS
SELECT .County,
    COUNT(*) occurrences
FROM fires f
GROUP BY f.County
ORDER BY occurrences DESC;

SELECT * FROM fires_count_counties;
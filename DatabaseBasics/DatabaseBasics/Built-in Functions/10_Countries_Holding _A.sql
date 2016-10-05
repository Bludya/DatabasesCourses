SELECT country_name, iso_code
FROM countries
WHERE LENGTH(country_name) - LENGTH(REPLACE(REPLACE(country_name,'A',''), 'a', '')) >= 3
ORDER BY iso_code
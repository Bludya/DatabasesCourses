SELECT town_id, name
FROM towns
WHERE name NOT RLIKE '^r|^b|^d'
ORDER BY(name)
SELECT town_id, name
FROM towns
WHERE name RLIKE '^M|^K|^B|^E'
ORDER BY(name)
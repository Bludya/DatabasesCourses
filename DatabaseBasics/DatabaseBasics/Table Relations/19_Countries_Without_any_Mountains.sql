SELECT	COUNT(c.country_code) AS country_code
  FROM	countries AS c
  LEFT	OUTER	JOIN	mountains_countries AS mc
    ON	c.country_code = mc.country_code
 WHERE	mc.mountain_id IS NULL
SELECT	c.country_code, COUNT(m.mountain_range) as mountain_ranges
  FROM	countries AS c
 INNER	JOIN mountains_countries AS mc
    ON	c.country_code = mc.country_code
 INNER	JOIN mountains AS m
    ON	mc.mountain_id = m.id
 WHERE	c.country_code IN ('US', 'BG', 'RU')
 GROUP	BY(c.country_code)

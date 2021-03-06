SELECT	c.country_code, m.mountain_range, p.peak_name, p.elevation
  FROM	countries AS c
 INNER	JOIN mountains_countries AS mc
    ON	c.country_code = mc.country_code
 INNER	JOIN mountains AS m
    ON	mc.mountain_id = m.id
 INNER	JOIN peaks AS p
    ON	mc.mountain_id = p.mountain_id
 WHERE	p.elevation > 2835
   AND	c.country_code = 'BG'
 ORDER	BY	p.elevation DESC
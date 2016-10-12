SELECT	c.country_name, 
		p.peak_name AS highest_peak_name,
		maxes.highest_peak_elevation,
		m.mountain_range
  FROM	countries AS c
 INNER	JOIN	mountains_countries AS mc
	ON	c.country_code = mc.country_code
 INNER	JOIN	mountains AS m
	ON	mc.mountain_id = m.id
 INNER	JOIN	peaks AS p
	ON	mc.mountain_id = p.mountain_id
 INNER	JOIN
		(
		SELECT	c.country_name, MAX(p.elevation) AS highest_peak_elevation
		  FROM	countries AS c
		 INNER	JOIN	mountains_countries AS mc
		    ON	c.country_code = mc.country_code
		 INNER	JOIN	mountains AS m
		    ON	mc.mountain_id = m.id
		 INNER	JOIN	peaks AS p
		    ON	mc.mountain_id = p.mountain_id
		 GROUP	BY c.country_name
		) AS maxes
	ON	maxes.country_name = c.country_name
   AND	maxes.highest_peak_elevation = p.elevation
 UNION
SELECT	c.country_name, 
		'(no highest peak)',
		'0',
		'(no mountain)'
  FROM	countries AS c
 INNER	JOIN	mountains_countries AS mc
    ON	c.country_code != mc.country_code
 GROUP	BY	c.country_name
 ORDER	BY	country_name, highest_peak_name
 LIMIT	5
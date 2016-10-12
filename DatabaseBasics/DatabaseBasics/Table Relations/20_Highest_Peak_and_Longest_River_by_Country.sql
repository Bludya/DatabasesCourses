SELECT	maxes.country_name,
		MAX(maxes.highest_peak_elevation) AS highest_peak_elevation,
		MAX(maxes.longest_river_length) AS longest_river_length
FROM	(
		SELECT	c.country_name, p.elevation AS highest_peak_elevation, r.length AS longest_river_length
		  FROM	countries AS c
		 LEFT	OUTER	JOIN	mountains_countries AS mc
		    ON	c.country_code = mc.country_code
		 LEFT	OUTER	JOIN	mountains AS m
		    ON	mc.mountain_id = m.id
		 LEFT	OUTER	JOIN	peaks AS p
		    ON	mc.mountain_id = p.mountain_id
		 LEFT	OUTER	JOIN	countries_rivers AS cr
		 	ON	c.country_code = cr.country_code
		 LEFT	OUTER	JOIN	rivers AS r
		 	ON	cr.river_id = r.id
		) AS maxes
 GROUP	BY	maxes.country_name
 ORDER	BY	highest_peak_elevation	DESC, 
 			longest_river_length	DESC,
 			country_name
 LIMIT	5
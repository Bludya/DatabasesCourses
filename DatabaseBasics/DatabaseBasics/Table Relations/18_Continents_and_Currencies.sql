SELECT	maxes.continent_code, c.currency_code, maxes.currency_usage
  FROM	(
  		SELECT	c.continent_code, MAX(c.currency_usage) AS currency_usage
  		  FROM	(
		  		SELECT	continent_code, currency_code, COUNT(currency_code) as currency_usage
		  		  FROM  countries
		  		 GROUP	BY continent_code, currency_code
		  		HAVING	COUNT(currency_usage) > 1
		  		) AS c
  		 GROUP	BY	c.continent_code
  		) AS maxes
 INNER	JOIN	
 		(
 		SELECT	continent_code, currency_code, COUNT(currency_code) as currency_usage
  		  FROM  countries
  		 GROUP	BY continent_code, currency_code
  		HAVING	COUNT(currency_usage) > 1
  		) AS c
  	ON	c.currency_usage = maxes.currency_usage
   AND	c.continent_code = maxes.continent_code
 ORDER	BY	c.continent_code
 
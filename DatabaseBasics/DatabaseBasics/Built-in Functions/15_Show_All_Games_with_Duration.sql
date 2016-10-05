SELECT	name AS 'Game',
		CASE
			WHEN HOUR(start) BETWEEN 0 AND 11
				THEN 'Morning'
			WHEN HOUR(start) BETWEEN 12 AND 17
				THEN 'Afternoon'
			WHEN HOUR(start) BETWEEN 18 AND 24
				THEN 'Evening'
		END 
		AS 'Parts of the day',
		CASE
			WHEN duration < 4
				THEN 'Extra Short'
			WHEN duration BETWEEN 4 AND 6
				THEN 'Short'
			WHEN duration > 6 
				THEN 'Long'
			WHEN duration IS NULL
				THEN 'Extra Long'
		END
		AS 'Duration'
FROM games
ORDER BY `Game`, `Duration`, `Parts of the Day`
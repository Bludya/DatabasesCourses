SELECT	user_name AS 'Username',
		ip_address AS 'IP Address'
FROM	users
WHERE	ip_address LIKE '___.1%.%.___'
ORDER BY `Username`	
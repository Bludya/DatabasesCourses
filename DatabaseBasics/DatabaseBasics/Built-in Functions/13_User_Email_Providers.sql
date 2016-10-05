SELECT	user_name AS Username, 
		SUBSTRING_INDEX(email, '@', -1) AS 'Email Provider'
FROM users
ORDER BY `Email Provider`, Username;


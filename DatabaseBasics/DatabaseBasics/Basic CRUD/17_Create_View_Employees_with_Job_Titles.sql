CREATE VIEW v_employees_job_titles AS
SELECT CONCAT(
			first_name, 
			' ', 
			CASE 
				WHEN middle_name IS NULL THEN ''
				ELSE middle_name
			END,
			' ', 
			last_name) AS full_name, 
		job_title
FROM employees
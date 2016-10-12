SELECT 	e.employee_id, first_name
  FROM 	employees AS e
 WHERE	e.employee_id NOT IN(
 	SELECT employee_id 
 	FROM employees_projects
 	)
 ORDER	BY	e.employee_id
 LIMIT	3
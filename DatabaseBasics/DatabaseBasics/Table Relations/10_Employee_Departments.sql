SELECT	employee_id, first_name, salary, a.name
  FROM	employees as e
 INNER	JOIN	departments AS a
 	ON	e.department_id = a.department_id
 WHERE	salary > 15000
 ORDER	BY	a.department_id ASC
 LIMIT	5